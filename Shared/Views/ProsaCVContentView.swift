//
//  ProsaCVContentView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

struct ProsaCVContentView: View {
  @ObservedObject var content: ConstTextsObserved

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
    let resume = content.resumeText

    //MARK: - info competences
    let competencesTitle = "Competences"
    let competences = content.competencesText

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
        ProsaCVItemContainerView(CVItemContainerTitle: resumeTitle, CVItemContainerSubTitle: resumeSubTitle, containerUrl: positionUrl, bodyContent: resume)
        Divider()
//MARK: -Competences
        ProsaCVItemContainerView(CVItemContainerTitle: competencesTitle, bodyContent: competences)
      }

      //Competences, Experience, Education cronological newest first
    }
  }
}

struct ProsaCVContentView_Previews: PreviewProvider {
  static var previews: some View {
    ProsaCVContentView(content: ConstTextsObserved())
  }
}

struct ProsaContactView: View {
  let name:String
  let phone:String
  let mail:String
  let street:String
  let postnumber :String
  let city :String
  let country :String
  var body: some View {
    VStack(alignment: .leading) {
      Text(name)
      Label(phone, systemImage: "phone.fill")
      Label(mail, systemImage: "mail")
      Divider().padding(.horizontal)
      Label(street, systemImage: "house")
      Label(postnumber+" "+city, systemImage: "arrow.right")
      Label(country, systemImage: "arrow.right")
    }
  }
}

struct TitleView: View {
  let title:String
  var body: some View {
    Text(title)
      .font(.title)
      .foregroundColor(Color("TextColorSubHeading"))
  }
}

struct ProsaCVItemContainerView: View {
  let CVItemContainerTitle : String
  var CVItemContainerSubTitle: String? = nil
  var containerUrl : String? = nil
  let bodyContent:String

  var body: some View {
    VStack(alignment: .leading) {
      //Title
      TitleView(title:CVItemContainerTitle)
      VStack(alignment: .leading) {
        (CVItemContainerSubTitle != nil) ?
        Text(CVItemContainerSubTitle!) : nil

        if #available(iOS 16.0, *) {
          (containerUrl != nil) ?
          Text(URL(string: containerUrl!) ?? URL(string: "http://saxjax.dk")!, format: .url) : nil
        }
        else {
          (containerUrl != nil) ?
          Text(containerUrl!) : nil
        }
      }
      Divider()
      //Content
      Text(bodyContent)
        .multilineTextAlignment(.leading)
    }
    .padding(.horizontal)
  }
}
