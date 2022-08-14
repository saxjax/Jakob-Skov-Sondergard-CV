//
//  AuthenticationHandler.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift



class AuthenticationHandler:ObservableObject,SaxjaxAuthManager,SaxjaxDataManager {


  @Published var isLoggedIn = false
  @Published var userEmail:String? = nil
  @Published var userPassword:String? = nil
  @Published var stateMessage:String? = nil
  @Published var storedData:CVContent? = nil

  init(){}

  init(observedContent:CVContent){
    storedData = observedContent
  }
  //  MARK: -User handling

  func registerNewUser(username:String,password:String){
    Auth.auth().createUser(withEmail: username, password: password){ (authDataResult, error) in
      if let e = error {
        self.setStateMessageFromError(error:e)
      }
      else {
        print(authDataResult!)
        print("succeeded in creating new user:\(username) with password:\(password)")
        self.isLoggedIn = true
        self.userEmail = username
        self.setStateMessageFromString(string: "Signed In as \(username)")
      }
    }
  }
  
  func loginWith(username:String,password:String){
    Auth.auth().signIn(withEmail: username, password: password){(authDataResult,error) in
      if let e = error {
        self.setStateMessageFromError(error: e)
      }
      else {
        print(authDataResult!)
        print("Successful login wit user-email: \(username):\(password)")
        print("Credential:\(String(describing: authDataResult!.credential))")
        self.isLoggedIn = true
        self.userEmail = username
        self.setStateMessageFromString(string:"Signed In as:\(username)")
      }
    }
  }

  func logOut(){
    do{
      try Auth.auth().signOut()
      self.isLoggedIn = false
      self.stateMessage = "Signed Out"
    }catch {
      print("Error signing out: \(error)")
      self.setStateMessageFromError(error: error)
    }
  }

  //  MARK: -Document handling
  func storeDataToDataStore(email: String?, password: String?, dataIdentifier: String?, data: Codable?) {
    if isLoggedIn == true {

      if let content:CVContent = data as? CVContent,  let user = Auth.auth().currentUser?.email , let cv = dataIdentifier{
        let uniqueIdentifier = "\(user):\(cv)"

        do{
          let db = Firestore.firestore()
          try db.collection(uniqueIdentifier).document(cv).setData(from: content)
          storedData = content
          setStateMessageFromString(string:  """
                                  Successfully saved CV with identifier:
                                  \(uniqueIdentifier)
                                  """)

        }catch {
          self.setStateMessageFromError(error: error)
        }
      }
    } else {
      stateMessage = "You must login before submitting a CV"
    }
  }

//  func storeDataToDataStore(email:String?=nil, password:String?=nil, dataIdentifier cvname:String?, data:CVContent?){
//    if isLoggedIn == true {
//
//      if let content = data,  let user = Auth.auth().currentUser?.email , let cv = cvname{
//        let uniqueIdentifier = "\(user):\(cv)"
//
//        do{
//          let db = Firestore.firestore()
//          try db.collection(uniqueIdentifier).document(cv).setData(from: content)
//          storedData = content
//          setStateMessageFromString(string:  """
//                                  Successfully saved CV with identifier:
//                                  \(uniqueIdentifier)
//                                  """)
//
//        }catch {
//          self.setStateMessageFromError(error: error)
//        }
//      }
//    } else {
//      stateMessage = "You must login before submitting a CV"
//    }
//
//
//
//  }

  func fetchData(uniqueIdentifier:String){
    let db = Firestore.firestore()
    let collectionName = uniqueIdentifier
    let documentName = String(uniqueIdentifier.split(separator: ":")[1])
    db.collection(collectionName).document(documentName).getDocument(as: CVContent.self){(result) in
      switch result {
        case .success(let cvContent):
          self.setStorredData(content: cvContent)
          self.setStateMessageFromString(string: "you did it: \(cvContent)")
        case .failure(let error):
          self.setStateMessageFromError(error: error)
      }
    }
  }

  func deleteData(uniqueIdentifier: String) {
    print("deleteData() has not been implemented")
  }


  private func createUniqueIdentifier(email:String = "", cvcode:String)->String{
    return "\(email):\(cvcode)"
  }

  private func setStorredData(content:CVContent){
    DispatchQueue.main.async {
      self.storedData = content
      print("Fetched this data:\(self.storedData!)")
    }
  }

  private func setStateMessageFromError(error:Error){
    DispatchQueue.main.async {
      self.stateMessage = error.localizedDescription
      print(self.stateMessage!)
    }
  }

  private func setStateMessageFromString(string:String){
    DispatchQueue.main.async {
      self.stateMessage = string
      print(self.stateMessage!)
    }
  }
}
