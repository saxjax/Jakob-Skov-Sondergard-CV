//
//  ProsaContactView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

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

struct ProsaContactView_Previews: PreviewProvider {
    static var previews: some View {
      ProsaContactView(name: "navn", phone: "+45 5379559", mail: "me@me.com", street: "a street 5", postnumber: "9000", city: "Aalborg", country: "Denmark")
    }
}
