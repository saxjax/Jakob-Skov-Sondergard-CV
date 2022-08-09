//
//  CVRegistrationAndRetrievalView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import SwiftUI


struct CVRegistrationAndRetrievalView: View {
  @Binding var username:String
  @Binding var pasword:String
  @Binding var cvname:String
  @StateObject var authHandler: AuthenticationHandler
  @ObservedObject var data: ConstTextsObserved

  var body: some View {
    VStack {
      Text("Email and CV ")
      TextField("user email",text: $username)
      TextField("unique 6 cipher CV name", text: $cvname)
      authHandler.stateMessage != nil ? Text("Status:\(authHandler.stateMessage! )"):nil
      HStack {
//#if os(macOS)
        Button("Register"){

          if username.isEmpty || cvname.isEmpty {
            print("you must fill in some values into both username and password")
          }
          else {
            authHandler.registerNewCV(email: self.username, cvname: self.cvname)
          }
        }
//#endif
        Button("Login"){
          print(username,cvname)
          if username.isEmpty || cvname.isEmpty {
            print("you must fill in some values into both username and password")
          }
          else {
            authHandler.loginToExistingCV(email: self.username, cvname: self.cvname)
          }
        }

        authHandler.isLoggedIn ? Button("LogOut"){
          authHandler.logOut()
          print("logged out")
        } :nil
      }

      TextField("Enter CV code", text: $cvname)
        .background(Color(Constants.TextColors.heading)).onSubmit {
//        cvDataObserved.companyName = cvDataObserved.cvCode


      }
      Button("submit"){
        let content = CVContent(constTexts: data)
        authHandler.addDataToCV(email: username, password: pasword, cvname: cvname, data: content)
      }


    }
    

  }
}

struct CVRegistrationAndRetrievalView_Previews: PreviewProvider {
  static let ah = AuthenticationHandler()
  static var previews: some View {
    CVRegistrationAndRetrievalView(username: .constant("me@me.com"), pasword: .constant("CV Identifier"),cvname: .constant("mycvname"), authHandler: ah, data: ConstTextsObserved())
  }
}





