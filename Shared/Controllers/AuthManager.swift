////
////  AuthManager.swift
////  Jakob Skov Sondergard CV
////
////  Created by Jakob Skov Søndergård on 13/08/2022.
////
//
//import Foundation
//import SwiftUI
//import FirebaseAuth
//
//class AuthMamnager:SaxjaxAuthManager{
//  @Binding var stateMessage:String
//  @State private var isLoggedIn:Bool = false
//  @Binding var userEmail:String
//  @Binding var password:String
//
//
//
//  func registerNewUser(username:String,password:String){
//    Auth.auth().createUser(withEmail: username, password: password){ (authDataResult, error) in
//      if let e = error {
//        self.setStateMessageFromError(error:e)
//      }
//      else {
//        print(authDataResult!)
//        print("succeeded in creating new user:\(username) with password:\(password)")
//        self.isLoggedIn = true
//        self.userEmail = username
//        self.setStateMessageFromString(string: "Signed In as \(username)")
//      }
//    }
//  }
//
//  func loginWith(username:String,password:String){
//    Auth.auth().signIn(withEmail: username, password: password){(authDataResult,error) in
//      if let e = error {
//        self.setStateMessageFromError(error: e)
//      }
//      else {
//        print(authDataResult!)
//        print("Successful login wit user-email: \(username):\(password)")
//        print("Credential:\(String(describing: authDataResult!.credential))")
//        self.isLoggedIn = true
//        self.userEmail = username
//        self.setStateMessageFromString(string:"Signed In as:\(username)")
//      }
//    }
//  }
//
//  func logOut(){
//    do{
//      try Auth.auth().signOut()
//      self.isLoggedIn = false
//      self.stateMessage = "Signed Out"
//    }catch {
//      print("Error signing out: \(error)")
//      self.setStateMessageFromError(error: error)
//    }
//  }
//
//  private func setStateMessageFromError(error:Error){
//    DispatchQueue.main.async {
//      self.stateMessage = error.localizedDescription
//      print(self.stateMessage)
//    }
//  }
//
//  private func setStateMessageFromString(string:String){
//    DispatchQueue.main.async {
//      self.stateMessage = string
//      print(self.stateMessage)
//    }
//  }
//}
