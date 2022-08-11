//
//  AuthenticationHandler.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthenticationHandler:ObservableObject {
  @Published var isLoggedIn = false
  @Published var userEmail:String? = nil
  @Published var userPassword:String? = nil
  @Published var stateMessage:String? = nil
  @Published var storedData:CVContent? = nil

  //  MARK: -User handling

  func registerNewUser(email:String,password:String){
    Auth.auth().createUser(withEmail: email, password: password){ (authDataResult, error) in
      if let e = error {
        self.setStateMessageFromError(error:e)
      }
      else {
        print(authDataResult!)
        print("succeeded in creating new user:\(email) with password:\(password)")
        self.isLoggedIn = true
        self.userEmail = email
        self.setStateMessageFromString(string: "Signed In as \(email)")
      }
    }
  }
  
  func loginWith(email:String,password:String){
    Auth.auth().signIn(withEmail: email, password: password){(authDataResult,error) in
      if let e = error {
        self.setStateMessageFromError(error: e)
      }
      else {
        print(authDataResult!)
        print("Successful login wit user-email: \(email):\(password)")
        print("Credential:\(String(describing: authDataResult!.credential))")
        self.isLoggedIn = true
        self.userEmail = email
        self.setStateMessageFromString(string:"Signed In as:\(email)")
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

  func storeDataToDataStore(email:String?=nil, password:String?=nil, cvname:String, data:CVContent?){
    if isLoggedIn == true {

      if let content = data,  let user = Auth.auth().currentUser?.email {
        let uniqueIdentifier = "\(user):\(cvname)"

        do{
          let db = Firestore.firestore()
          try db.collection(uniqueIdentifier).document(cvname).setData(from: content)
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


  private func createUniqueIdentifier(email:String = "", cvcode:String)->String{
    return "\(email):\(cvcode)"
  }

  private func setStorredData(content:CVContent){
    DispatchQueue.main.async {
      self.storedData = content
      print(self.stateMessage!)
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
