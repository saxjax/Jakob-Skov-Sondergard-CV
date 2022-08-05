//
//  JobSectionView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct JobSectionView: View {
    var body: some View {

        VStack{
            CVSection(showContent: true, imageName: "rosette", sectionTitle: "Education", sectionItems: ConstTexts.education)
            CVSection(imageName:"wrench.and.screwdriver.fill",sectionTitle: "Profesional experience", sectionItems: ConstTexts.experience)
            CVSection(sectionTitle: "Study related experience", sectionItems: ConstTexts.studyRelatedExperience)
            CVSection(imageName:"book",sectionTitle: "Publications", sectionItems: ConstTexts.publications)
            CVSection(imageName: "keyboard.fill",sectionTitle: "Programming Languages", sectionItems: ConstTexts.languages)
            CVSection(imageName:"oval.fill",sectionTitle: "Framaworks", sectionItems: ConstTexts.frameworks)
        }
    }
}

struct JobSectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSectionView()
    }
}
