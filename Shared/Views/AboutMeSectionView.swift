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
  @Binding var aboutMe:[CVItem]
  @Binding var ultraResume:[CVItem]

  var body: some View {
    VStack {
      CVSectionView(showContent:true,activeTitle: false,sectionTitle: "About Me", sectionItems: aboutMe).background(Color.clear)
      CVSectionView(showContent:true,activeTitle: false,sectionTitle: "Speedy Resume", sectionItems: ultraResume).padding(.leading)
      AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount)
    }.padding(.horizontal)

  }
}

struct AboutMeSectionView_Previews: PreviewProvider {
  static let content = CVContentInitialValues()
  static var previews: some View {
    AboutMeSectionView(showAboutMe: .constant(true), rotationAmount: .constant(360.0), aboutMe: .constant(content.aboutMe), ultraResume: .constant(content.ultraResume))
  }
}
