//
//  InfoView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI

struct SimpleInfoView: View {
    @State var text:String
    let imageName:String?

    var body: some View {

        HStack(alignment: .top) {
                    Image(systemName: imageName ?? "")
                        .foregroundColor(.green)
                        .padding([.top, .leading])
                        .fixedSize(horizontal: true, vertical: true)
                    Text(text)
                .font(.custom(Constants.FontType.body, size: 15, relativeTo: .body))
                .foregroundColor(Color(Constants.TextColors.body))
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .padding([.top, .bottom, .trailing])



//                        .fixedSize(horizontal: false, vertical: true)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color(Constants.TextColors.body),lineWidth: 3)
                ).background(Color(Constants.TextColors.appBackground))


    }
}

struct SimpleInfoView_Previews: PreviewProvider {
    static let text = """
Software Engineer | Novia, Jakobsstad. jan 2021
    Responsible for further development and maintenance of the React JS web app NOTIO. Including system design, work planning, product vision, aligning customer expectation to available budget, continuous integration, setting milestones  and building releases.

Software Engineer | Private projects. 2018-Present
    Designed, implemented and shipped an IOS application (Saxjax tuner) to app-store allowing users from around the world to intelligently track their pitch-tuning on wind instruments, and teaching students about pitch. Utilising hardware interaction through the external library AudioKit. This is an ongoing project that I intend to refactor using SwiftUI, and the MVVM pattern implementing the knowledge I have gained during my study.
    Designed, developed and shipped a simple math learning IOS application (saxjax Den Lille Tabel) for learning kids the multiplication tables.
"""
    static let text2 = """
1
2
3
4
5
"""
    static var previews: some View {
      SimpleInfoView(text: text2 ,imageName: "phone.fill").previewLayout(.sizeThatFits)
      SimpleInfoView(text: text2 ,imageName: "phone.fill").previewLayout(.sizeThatFits).preferredColorScheme(.dark)
    }
}
