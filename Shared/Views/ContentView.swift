//
//  ContentView.swift
//  Shared
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
     @State private var showAboutMe = false
     @State private var rotationAmount = 0.0

    var body: some View {
        let CT = ConstTexts.self

        ZStack {
            Color(Constants.TextColors.appBackground)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack {
                    HStack {
                        Image("Jakob")
                            .resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250, alignment: .top)
                            .clipShape(Ellipse())
                            .overlay(Circle().stroke(Color.green,lineWidth: 3))
                            .rotation3DEffect(.degrees(rotationAmount), axis: (x:0.5,y:1,z:0.6))
                    }
                    


                    Text("Jakob Skov Søndergård")
                        .font(.custom(Constants.FontType.heading, size: 30, relativeTo: .largeTitle))
                        .foregroundColor(Color(Constants.TextColors.name))
                        .padding(.top)

                    AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount).rotation3DEffect(.degrees(rotationAmount), axis: (x:1,y:0,z:0))


                    showAboutMe ?
                    VStack {
                        CVSection(showContent:true,activeTitle: false,sectionTitle: "About Me", sectionItems: CT.aboutMe).background(Color.clear)
                        CVSection(showContent:true,activeTitle: false,sectionTitle: "Speedy Resume", sectionItems: CT.ultraResume).padding(.leading)
                        AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount)
                    }.padding(.horizontal)
                    : nil


                    Text("Software Engineer")
                        .font(.custom(Constants.FontType.subHeading, size: 24, relativeTo: .title))
                        .foregroundColor(Color(Constants.TextColors.subHeading))
                    SimpleInfoView(text: "+45  53 37 95 59", imageName: "phone.fill")
                    SimpleInfoView(text: "saxjax@saxjax.dk", imageName: "envelope.fill")



                    Divider()

                    showAboutMe ? nil :
                    VStack{
                        CVSection(showContent: true, imageName: "rosette", sectionTitle: "Education", sectionItems: CT.education)
                        CVSection(imageName:"wrench.and.screwdriver.fill",sectionTitle: "Profesional experience", sectionItems: CT.experience)
                        CVSection(sectionTitle: "Study related experience", sectionItems: CT.studyRelatedExperience)
                        CVSection(imageName:"book",sectionTitle: "Publications", sectionItems: CT.publications)
                        CVSection(imageName: "keyboard.fill",sectionTitle: "Programming Languages", sectionItems: CT.languages)
                        CVSection(imageName:"oval.fill",sectionTitle: "Framaworks", sectionItems: CT.frameworks)
                    }
                }
            }
        }



    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .previewInterfaceOrientation(.portrait).preferredColorScheme(.dark)
    }
}





struct AboutMeButton: View {
    @Binding var showAboutMe: Bool
    @Binding var rotation: Double
    private let aboutMeText = "About Me"
    private let hideAboutMeText="Hide About Me"

    var body: some View {
        Button() {
            withAnimation(.interpolatingSpring(stiffness: Constants.Spring.stiffness, damping: Constants.Spring.damping)){
                showAboutMe.toggle()
                switch showAboutMe {
                    case true:
                        rotation += 1440.0
                        case false:
                        rotation -= 360.0
                }
            }
        }
    label:{ Label(showAboutMe ?  hideAboutMeText : aboutMeText,
                  systemImage: showAboutMe ? "arrow.up.circle" :"arrow.right.circle")
    }
    }
}
