//
//  JobSectionView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct JobSectionView: View {
  @Binding var education:[CVItem]?
  @Binding var experience:[CVItem]?
  @Binding var studyRelatedExperience:[CVItem]?
  @Binding var publications:[CVItem]?
  @Binding var languages:[CVItem]?
  @Binding var frameworks:[CVItem]?


    var body: some View {

        VStack{
          CVSectionView(showContent: true, imageName: "rosette", sectionTitle: "Education", sectionItems: education)
            CVSectionView(imageName:"wrench.and.screwdriver.fill",sectionTitle: "Profesional experience", sectionItems: experience)
            CVSectionView(sectionTitle: "Study related experience", sectionItems: studyRelatedExperience)
            CVSectionView(imageName:"book",sectionTitle: "Publications", sectionItems: publications)
            CVSectionView(imageName: "keyboard.fill",sectionTitle: "Programming Languages", sectionItems: languages)
            CVSectionView(imageName:"oval.fill",sectionTitle: "Framaworks", sectionItems: frameworks)
        }
    }
}

struct JobSectionView_Previews: PreviewProvider {
  static let content = CVContentInitialValues()
    static var previews: some View {
      JobSectionView(education: .constant(content.education),
                     experience: .constant(content.experience),
                     studyRelatedExperience: .constant(content.studyRelatedExperience),
                     publications: .constant(content.publications),
                     languages: .constant(content.languages),
                     frameworks: .constant(content.frameworks))
    }
}
