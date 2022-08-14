//
//  SaxjaxAuthManager.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 12/08/2022.
//

import Foundation
protocol SaxjaxAuthManager{
  func registerNewUser(username:String,password:String)
  func loginWith(username:String,password:String)
  func logOut()
}
