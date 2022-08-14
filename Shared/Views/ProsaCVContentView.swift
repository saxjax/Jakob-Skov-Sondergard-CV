//
//  ProsaCVContentView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

struct ProsaCVContentView: View {
  @ObservedObject var content: CVContent

  var body: some View {
    //MARK: - info contact
    let name = content.name
    let phone = content.phone
    let mail = content.mail
    let address = content.address


    //MARK: - info position
    let resumeTitle = "Resume"
    let resumeSubTitle = content.resumeSubTitle
    let positionUrl = content.positionUrl
//    var resume = content.resumeText

    //MARK: - info competences
    let competencesTitle = "Competences"
//    let competences = content.competencesText

    VStack {
      TextField("Enter Company Name", text: $content.companyName)
        .textCase(.uppercase)
        .onSubmit {

        }
      //Contact
      HStack {
        ProsaContactView(name: name, phone: phone, mail: mail, street: address.street, postnumber: address.postnumber, city: address.city, country: address.country)
        Image("Jakob").resizable().aspectRatio(contentMode: .fit)
      }
      Divider()

      ScrollView {
//MARK: -Resume
        ProsaCVItemContainerView(CVItemContainerTitle: resumeTitle, CVItemContainerSubTitle: resumeSubTitle, containerUrl: positionUrl, bodyContent: $content.resumeText)
        Divider()
//MARK: -Competences
        ProsaCVItemContainerView(CVItemContainerTitle: competencesTitle, bodyContent: $content.competencesText)
      }

      //Competences, Experience, Education cronological newest first
    }
  }
}

struct ProsaCVContentView_Previews: PreviewProvider {
  static var previews: some View {
    ProsaCVContentView(content: CVContentInitialValues())
  }
}


