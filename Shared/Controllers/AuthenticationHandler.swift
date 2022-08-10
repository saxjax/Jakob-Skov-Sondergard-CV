//
//  AuthenticationHandler.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import Foundation
import Firebase
class AuthenticationHandler:ObservableObject {
  @Published var isLoggedIn = false
  @Published var userEmail:String? = nil
  @Published var userPassword:String? = nil
  @Published var stateMessage:String? = nil

  func registerNewCV(email:String,cvname:String){
    Auth.auth().createUser(withEmail: email, password: cvname){ (authDataResult, error) in
      if let e = error {
        self.stateMessage = e.localizedDescription
      }
      else {
        print(authDataResult!)
        print("succeeded in creating CV: \(email):\(cvname)")
        self.isLoggedIn = true
        self.stateMessage = "Signed In"
      }
    }
  }
  
  func loginToExistingCV(email:String,cvname:String){
    Auth.auth().signIn(withEmail: email, password: cvname){(authResult,error) in
      if let e = error {
        self.stateMessage = e.localizedDescription
      }
      else {
        print(authResult!)
        print("succeeded in finding user-email: \(email):\(cvname)")
        self.isLoggedIn = true
        self.stateMessage = "Signed In"
      }

    }

  }

  func addDataToCV(email:String,password:String,cvname:String, data:CVContent?){
    if isLoggedIn == true {
      let encoder = JSONEncoder()
      encoder.outputFormatting = .prettyPrinted

      if let content = data,  let user = Auth.auth().currentUser?.email {
        let uniqueIdentifier = "\(user):\(content.cvCode)"

        do{
          let encodedContent = try JSONEncoder().encode(data)
          let json = String(data:encodedContent,encoding:String.Encoding.utf8)

          let db = Firestore.firestore()
          db.collection(uniqueIdentifier)
            .addDocument(data:["cv_content": json!]){ (error) in
              if let e = error {
                self.stateMessage = e.localizedDescription
              }
              else {
                self.stateMessage = """
                                  Successfully saved CV with identifier:
                                  \(uniqueIdentifier)
                                  """
              }
            }
        }catch {
          print("could not convert content to json in addDataToCV function")
          stateMessage = "CV could not be converted to be sent on the network. You could try again"
        }
      }
    } else {
      stateMessage = "You must login before submitting a CV"
    }



  }

  func logOut(){
    do{
      try Auth.auth().signOut()
      self.isLoggedIn = false
      self.stateMessage = "Signed Out"
    }catch let signOutError as Error{
      print("Error signing out: \(signOutError)")
      self.stateMessage = signOutError.localizedDescription
    }
  }
}
