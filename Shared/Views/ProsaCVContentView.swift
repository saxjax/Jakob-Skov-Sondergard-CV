//
//  ProsaCVContentView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

struct ProsaCVContentView: View {
    let name = ConstTexts.name
    let phone = ConstTexts.phone
    let mail = ConstTexts.mail
    let street = ConstTexts.address.street
    let postnumber = ConstTexts.address.postnumber
    let city = ConstTexts.address.city
    let country = ConstTexts.address.country
    var body: some View {
        VStack {
            //Contact
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                    Label(phone, systemImage: "phone.fill")
                    Label(mail, systemImage: "mail")
                    Label(street, systemImage: "city")
                    Label(postnumber,systemImage: "")
                    Label(city, systemImage: "")
                    Label(country, systemImage: "")
                }
                Image("Jakob").resizable().aspectRatio(contentMode: .fit)
            }
            //Pitch

            //Competences, Experience, Education cronological newest first
        }

    }
}

struct ProsaCVContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProsaCVContentView()
    }
}
