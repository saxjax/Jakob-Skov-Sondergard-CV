//
//  ContactInfoView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct ContactInfoView: View {
    var body: some View {
        VStack {
            Text("Software Engineer")
                .font(.custom(Constants.FontType.subHeading, size: 24, relativeTo: .title))
                .foregroundColor(Color(Constants.TextColors.subHeading))
            SimpleInfoView(text: "+45  53 37 95 59", imageName: "phone.fill")
            SimpleInfoView(text: "saxjax@saxjax.dk", imageName: "envelope.fill")
        }
    }
}

struct ContactInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ContactInfoView()
    }
}
