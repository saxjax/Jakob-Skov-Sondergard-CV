//
//  JobSectionView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct JobSectionView: View {
  @State var education:[CVItem]?
  @State var experience:[CVItem]?
  @State var studyRelatedExperience:[CVItem]?
  @State var publications:[CVItem]?
  @State var languages:[CVItem]?
  @State var frameworks:[CVItem]?


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
      JobSectionView(education: content.education, experience: content.experience, studyRelatedExperience: content.studyRelatedExperience, publications: content.publications, languages: content.languages, frameworks: content.frameworks)
    }
}
