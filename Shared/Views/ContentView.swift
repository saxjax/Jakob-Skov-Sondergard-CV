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
  @ObservedObject var authHandler:AuthenticationHandler
  @ObservedObject var cvDataObserved:CVContent //= CVContentInitialValues() //ConstTextsObserved()
  
    var body: some View {
      NavigationView{
        VStack{
          CVRegistrationAndRetrievalView(username: $enteredEmail,
                                         password: $enteredCode,
                                         cvname: $cvDataObserved.cvCode,
                                         authHandler: authHandler, data: cvDataObserved)
          Divider()
          NavigationLink(destination: RoundedBruttoCVView(content: cvDataObserved)){
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
  static let auth = AuthenticationHandler()
  static let data = CVContentInitialValues()

  static var previews: some View {
        ContentView(authHandler: auth, cvDataObserved: data)
            .previewInterfaceOrientation(.portrait)
        ContentView(authHandler: auth, cvDataObserved: data)
            .previewInterfaceOrientation(.portrait).preferredColorScheme(.dark)
    }
}



//TODO: movo out into separate file
struct RoundedBruttoCVView: View {
  @State private var showAboutMe = false
  @State private var rotationAmount = 0.0
  @ObservedObject var content:CVContent

  var body: some View {
    ZStack {
      Color(Constants.TextColors.appBackground)
        .edgesIgnoringSafeArea(.all)
      ScrollView{

        VStack {
          TopPresentationView(rotationAmount: $rotationAmount,imageName: $content.imageName, name:$content.name)

          AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount).rotation3DEffect(.degrees(rotationAmount), axis: (x:1,y:0,z:0))

          showAboutMe ? AboutMeSectionView(showAboutMe: $showAboutMe, rotationAmount: $rotationAmount,aboutMe: $content.aboutMe, ultraResume: $content.ultraResume) : nil

          ContactInfoView(telephone: $content.phone, mail: $content.mail)
          Divider()
          showAboutMe ? nil : JobSectionView(education: $content.education, experience: $content.experience, studyRelatedExperience: $content.studyRelatedExperience, publications: $content.publications, languages: $content.languages, frameworks: $content.frameworks)
        } //VStack

      }
    }
  }
}
