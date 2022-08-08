//
//  ContentView.swift
//  Shared
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
  @State var enteredEmail = "1@2.dk"
  @State var enteredCode = "123456"
  @State var CVdata = ConstTexts()
  @StateObject var cvDataObserved = ConstTextsObserved()

    var body: some View {
      NavigationView{
        VStack{
          CVRegistrationAndRetrievalView(username: $enteredEmail, cvname: $enteredCode, authHandler: AuthenticationHandler())
          TextField("Enter CV code", text: $cvDataObserved.cvCode).background(Color(Constants.TextColors.heading)).onSubmit {
            cvDataObserved.companyName = cvDataObserved.cvCode
          }
          NavigationLink(destination: RoundedBruttoCVView()){
            Text("Complete CV")
          }.navigationTitle("select CV").padding(.vertical)

          NavigationLink(destination: ProsaCVContentView(content: cvDataObserved)) {
            Text("Job Specific CV")
          }
        }//.navigationBarTitle("Navigate").padding(.horizontal)
        ProsaCVContentView(content: cvDataObserved)
      }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewInterfaceOrientation(.portrait).preferredColorScheme(.dark)
    }
}




struct RoundedBruttoCVView: View {
  @State private var showAboutMe = false
  @State private var rotationAmount = 0.0

  var body: some View {
    ZStack {
      Color(Constants.TextColors.appBackground)
        .edgesIgnoringSafeArea(.all)
      ScrollView{

        VStack {
          TopPresentationView(rotationAmount: $rotationAmount)

          AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount).rotation3DEffect(.degrees(rotationAmount), axis: (x:1,y:0,z:0))

          showAboutMe ? AboutMeSectionView(showAboutMe: $showAboutMe, rotationAmount: $rotationAmount) : nil

          ContactInfoView()
          Divider()
          showAboutMe ? nil : JobSectionView()
        } //VStack

      }
    }
  }
}
