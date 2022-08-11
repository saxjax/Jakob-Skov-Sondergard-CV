//
//  CVRegistrationAndRetrievalView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import SwiftUI


struct CVRegistrationAndRetrievalView: View {
  @Binding var username:String
  @Binding var password:String
  @Binding var cvname:String
  @StateObject var authHandler: AuthenticationHandler
  @ObservedObject var data: ConstTextsObserved

  var body: some View {
    VStack {
      Text("Email and CV ")
      TextField("user email",text: $username)
      TextField("password", text: $password)
      authHandler.stateMessage != nil ? Text("Status:\(authHandler.stateMessage! )"):nil
      HStack {
//#if os(macOS)
        Button("Register"){

          if username.isEmpty || password.isEmpty {
            print("you must fill in some values into both username and password")
          }
          else {
            authHandler.registerNewUser(email: self.username, password: self.password)
          }
        }.disabled((username.isEmpty || password.isEmpty))
//#endif
        Button("Login"){
          print(username,cvname)
          if username.isEmpty || password.isEmpty {
            print("you must fill in some values into both username and password")
          }
          else {
            authHandler.loginWith(email: self.username, password: self.password)
          }
        }.disabled((username.isEmpty || password.isEmpty))

        authHandler.isLoggedIn ? Button("LogOut"){
          authHandler.logOut()
          print("logged out")
        } :nil
      }

      TextField("Enter CV code", text: $cvname)
        .background(Color(Constants.TextColors.heading)).onSubmit {
        data.companyName = data.cvCode
      }


      authHandler.storedData != nil ?
      HStack {
        Text("unique identifier code:")
        Text("\(username):\(cvname)")
      }
        : nil


      Button("submit"){
        let content = CVContent(constTexts: data)
        authHandler.storeDataToDataStore(email: username, password: password, cvname: cvname, data: content)
      }
      Button("fetch"){
        authHandler.fetchData(collectionName: self.cvname)
      }


    }
    

  }
}

struct CVRegistrationAndRetrievalView_Previews: PreviewProvider {
  static let ah = AuthenticationHandler()
  static var previews: some View {
    CVRegistrationAndRetrievalView(username: .constant("me@me.com"), password: .constant("CV Identifier"),cvname: .constant("myCvName"), authHandler: ah, data: ConstTextsObserved())
  }
}





