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
            CVSectionView(showContent: true, imageName: "rosette", sectionTitle: "Education", sectionItems: ConstTexts.education)
            CVSectionView(imageName:"wrench.and.screwdriver.fill",sectionTitle: "Profesional experience", sectionItems: ConstTexts.experience)
            CVSectionView(sectionTitle: "Study related experience", sectionItems: ConstTexts.studyRelatedExperience)
            CVSectionView(imageName:"book",sectionTitle: "Publications", sectionItems: ConstTexts.publications)
            CVSectionView(imageName: "keyboard.fill",sectionTitle: "Programming Languages", sectionItems: ConstTexts.languages)
            CVSectionView(imageName:"oval.fill",sectionTitle: "Framaworks", sectionItems: ConstTexts.frameworks)
        }
    }
}

struct JobSectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSectionView()
    }
}
