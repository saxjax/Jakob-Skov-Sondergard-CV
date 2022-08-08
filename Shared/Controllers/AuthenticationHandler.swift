//
//  AuthenticationHandler.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import Foundation
import FirebaseAuth
class AuthenticationHandler:ObservableObject {

  func registerNewCV(email:String,cvname:String){
    Auth.auth().createUser(withEmail: email, password: cvname){ (authDataResult, error) in
      if let e = error {
        print(e)
      }
      else {
        print(authDataResult!)
        print("succeeded in creating CV: \(email):\(cvname)")
      }
    }
  }
  
  func loginToExistingCV(email:String,cvname:String){
    Auth.auth().signIn(withEmail: email, password: cvname){[weak self](authResult,error) in
      guard let strongSelf = self else {return}

    }
    print("succeeded in finding CV: \(email):\(cvname)")
  }

  func addDataToCV(email:String,cvname:String,data:Data){

  }
}
