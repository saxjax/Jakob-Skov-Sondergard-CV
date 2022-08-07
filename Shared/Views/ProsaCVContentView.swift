//
//  ProsaCVContentView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

struct ProsaCVContentView: View {

  //MARK: - info contact
  let name = ConstTexts.name
  let phone = ConstTexts.phone
  let mail = ConstTexts.mail
  let street = ConstTexts.address.street
  let postnumber = ConstTexts.address.postnumber
  let city = ConstTexts.address.city
  let country = ConstTexts.address.country
  //MARK: - info position
  let resumeTitle = "Resume"
  let positionUrl = ConstTexts.positionUrl
  @State var resume = ConstTexts.resumeText

  //MARK: - info competences
  let competencesTitle = "Competences"
  @State var competences = ConstTexts.competencesText

  var body: some View {
    VStack {
      //Contact
      HStack {
        ContactView(name: name, phone: phone, mail: mail, street: street, postnumber: postnumber, city: city, country: country)
        Image("Jakob").resizable().aspectRatio(contentMode: .fit)
      }
      Divider()
      //Greeting to specific position

      ScrollView {
        ProsaCVItemContainerView(CVItemContainerTitle: resumeTitle, containerUrl: positionUrl, resume: $resume)
        Divider()

        ProsaCVItemContainerView(CVItemContainerTitle: competencesTitle, resume: $competences)
      }




      //Competences, Experience, Education cronological newest first
    }

  }
}

struct ProsaCVContentView_Previews: PreviewProvider {
  static var previews: some View {
    ProsaCVContentView()
  }
}

struct ContactView: View {
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
      Label(street, systemImage: "city")
      Label(postnumber + " " + city ,systemImage: "")

      Label(country, systemImage: "")
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

  @Binding var resume:String

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
      Text(resume)
        .multilineTextAlignment(.leading)
      //                .frame(maxHeight: .infinity)
    }
    .padding(.horizontal)
  }
}
