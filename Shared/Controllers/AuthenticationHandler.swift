//
//  AuthenticationHandler.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import Foundation
import FirebaseAuth
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

  func addDataToCV(email:String,cvname:String,data:Data){

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
