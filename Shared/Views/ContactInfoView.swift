//
//  ContactInfoView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct ContactInfoView: View {
  @Binding var telephone:String
  @Binding var mail:String
    var body: some View {
        VStack {
            Text("Software Engineer")
                .font(.custom(Constants.FontType.subHeading, size: 24, relativeTo: .title))
                .foregroundColor(Color(Constants.TextColors.subHeading))
            SimpleInfoView(text: telephone, imageName: "phone.fill")
            SimpleInfoView(text: mail, imageName: "envelope.fill")
        }
    }
}

struct ContactInfoView_Previews: PreviewProvider {

    static var previews: some View {
      ContactInfoView(telephone: .constant("12345678"), mail: .constant("1@2.dk"))
    }
}
