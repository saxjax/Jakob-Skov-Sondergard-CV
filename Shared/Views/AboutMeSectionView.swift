//
//  AboutMeSectionView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct AboutMeSectionView: View {
    @Binding var showAboutMe: Bool
    @Binding var rotationAmount: Double
    var body: some View {
        VStack {
            CVSection(showContent:true,activeTitle: false,sectionTitle: "About Me", sectionItems: ConstTexts.aboutMe).background(Color.clear)
            CVSection(showContent:true,activeTitle: false,sectionTitle: "Speedy Resume", sectionItems: ConstTexts.ultraResume).padding(.leading)
            AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount)
        }.padding(.horizontal)

    }
}

struct AboutMeSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeSectionView(showAboutMe: .constant(true), rotationAmount: .constant(360.0))
    }
}
