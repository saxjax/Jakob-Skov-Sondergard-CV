//
//  CVRegistrationAndRetrievalView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 08/08/2022.
//

import SwiftUI


struct CVRegistrationAndRetrievalView: View {
  @Binding var username:String
  @Binding var cvname:String
  @StateObject var authHandler: AuthenticationHandler
  var body: some View {
    VStack {
      Text("Email and CV ")
      TextField("user email",text: $username)
      TextField("unique 6 cipher CV name", text: $cvname)
      HStack {
#if os(macOS)
        Button("Register new CV"){

          if username.isEmpty || cvname.isEmpty {
            print("you must fill in some values into both username and password")
          }
          else {
            do{
              try authHandler.registerNewCV(email: self.username, cvname: self.cvname)
              
            }catch{
              //TODO:Create throwing function
            }
          }
        }
#endif
        Button("Get CV"){
          print(username,cvname)
          if username.isEmpty || cvname.isEmpty {
            print("you must fill in some values into both username and password")
          }
          else {
            authHandler.loginToExistingCV(email: self.username, cvname: self.cvname)
          }
        }
      }


    }
    

  }
}

struct CVRegistrationAndRetrievalView_Previews: PreviewProvider {
  static let ah = AuthenticationHandler()
  static var previews: some View {
    CVRegistrationAndRetrievalView(username: .constant("me@me.com"), cvname: .constant("CV Identifier"), authHandler: ah)
  }
}





