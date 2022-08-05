//
//  CVSection.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI

struct CVSection: View {
    @State var showContent = false
    @State var activeTitle = true
    @State var imageName = "eyeglasses"

    let sectionTitle:String
    let sectionItems:[CVItem]

    var body: some View {
        VStack {
            HStack {
                Button {

                    withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)){
                        if activeTitle  {showContent.toggle()}
                        else {}
                    }
                }
                    label:{
                        Label{ Text(sectionTitle).padding(.bottom)
                                .font(.custom(Constants.FontType.heading, size: 24, relativeTo: .title))
                                .foregroundColor(Color(Constants.TextColors.heading))
                                .padding(.leading)
                        }
                    icon: {
                        activeTitle ?
                        Image(systemName:showContent ?  "arrow.up":"arrow.down" ) : nil

                    }
                    }
                Spacer()
            }
            showContent ?
            VStack {
                ForEach(sectionItems, id: \.self.id) {item in
                    HStack {
                        VStack {
                            Text(item.title).textCase(.uppercase)
                                .foregroundColor(Color(Constants.TextColors.subHeading))
                            item.body != nil ?
                            SimpleInfoView(text: item.body ?? "", imageName: imageName) : nil
                            //                            Divider()
                        }
                        Spacer()
                    }
                }

                activeTitle ?
                Button {
                    withAnimation(.interpolatingSpring(stiffness: Constants.Spring.stiffness,
                                                       damping: Constants.Spring.damping)){
                        if activeTitle  {showContent.toggle()}
                        else {}
                    }
                }
            label:{
                Label{ Text("Close").padding(.bottom)
                        .font(.custom(Constants.FontType.heading, size: 24, relativeTo: .title))
                        .foregroundColor(Color(Constants.TextColors.heading))
                        .padding(.leading)
                }
            icon: {
                activeTitle ?
                Image(systemName:"arrow.up" ) : nil

            }
            } : nil
            }
             : nil
        }
    }
}

struct CVSection_Previews: PreviewProvider {
    static let experience:[CVItem] = [
        CVItem(id:0,
               title:"""
Software Engineer | Novia, Jakobsstad. jan 2021
""",
               body:"""
    Responsible for further development and maintenance of the React JS web app NOTIO. Including system design, work planning, product vision, aligning customer expectation to available budget, continuous integration, setting milestones  and building releases.
"""),
        CVItem(id:1,
               title: """
Software Engineer | Private projects. 2018-Present
""",
               body: """
"Designed, implemented and shipped an IOS application (Saxjax tuner) to app-store allowing users from around the world to intelligently track their pitch-tuning on wind instruments, and teaching students about pitch. Utilising hardware interaction through the external library AudioKit. This is an ongoing project that I intend to refactor using SwiftUI, and the MVVM pattern implementing the knowledge I have gained during my study.
    Designed, developed and shipped a simple math learning IOS application (saxjax Den Lille Tabel) for learning kids the multiplication tables.
""")
    ]
    static var previews: some View {
        CVSection(showContent: true, sectionTitle: "Testing", sectionItems: experience)
    }
}
