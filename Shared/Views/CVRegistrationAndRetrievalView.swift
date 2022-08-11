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
  @State var manage = true
  @State var uniqueId = ""

  var body: some View {
    VStack {
      HStack {
        Button("View CV's  "){manage = false}.background(manage ? Color.clear : Color(Constants.ButtonColors.selected))
        Button("manage CV's"){manage = true}.background(manage ?  Color(Constants.ButtonColors.selected):Color.clear )
        Spacer()
      }

      VStack {
        Form(){
          Section("Messages"){
            authHandler.stateMessage != nil ? Text("Status:\(authHandler.stateMessage! )"):nil
          }
          Section("Current cata"){
            authHandler.isLoggedIn ? VStack{
              Text("Logged in as \(authHandler.userEmail!)")
            }:nil
            authHandler.storedData != nil ?
            HStack {
              Text("unique identifier code:")
              Text("\(uniqueId)")
              Spacer()
            }
            : nil
          }
          manage ? Section("Login"){
          VStack {
            HStack {
              Text("email:")
              TextField("Enter email",text: $username)
            }
            HStack {
              Text("password:")
              TextField("Enter password", text: $password)
            }
          }
          HStack {
            Button("Register"){

              if username.isEmpty || password.isEmpty {
                print("you must fill in some values into both username and password")
              }
              else {
                authHandler.registerNewUser(email: self.username, password: self.password)
              }
            }.disabled((username.isEmpty || password.isEmpty))
            Divider()
            Button("Log in"){
              print(username,cvname)
              if username.isEmpty || password.isEmpty {
                print("you must fill in some values into both username and password")
              }
              else {
                authHandler.loginWith(email: self.username, password: self.password)
              }
            }.disabled((username.isEmpty || password.isEmpty))
            Divider()
            authHandler.isLoggedIn ? Button("Log out"){
              authHandler.logOut()
              print("logged out")
            } :nil
          }.buttonStyle(BorderlessButtonStyle())
        }
          : nil

          manage ? Section("Manage your CV documents"){
            HStack {
              Text("CV name")
              TextField("Enter CV code", text: $cvname)
                .background(Color(Constants.TextColors.textFieldHighlighted)).onSubmit {
                  data.companyName = data.cvCode

                }
            }
            Button("submit"){
              let content = CVContent(constTexts: data)
              authHandler.storeDataToDataStore(email: username, password: password, cvname: cvname, data: content)
              self.uniqueId = "\(username):\(cvname)"

            }


          }
          : nil

          !manage ? Section("Display CV from code"){
            HStack {
              Text("unique identifier code:")
              TextField(uniqueId.isEmpty ?  "Enter cv identifier" : uniqueId, text: $uniqueId)
            }

            HStack {
              Button("fetch"){
                authHandler.fetchData(uniqueIdentifier: self.uniqueId)
              }
              Button("Scan QR"){}.disabled(true)
            }
          }
          : nil

        } //Form

      }

    }

  }
}

struct CVRegistrationAndRetrievalView_Previews: PreviewProvider {
  static let ah = AuthenticationHandler()
  static var previews: some View {
    CVRegistrationAndRetrievalView(username: .constant("me@me.com"), password: .constant("my password"),cvname: .constant("myCvName"), authHandler: ah, data: ConstTextsObserved())
  }
}





