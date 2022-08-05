//
//  AboutMeButton.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI

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

struct AboutMeButton_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeButton(showAboutMe: .constant(false), rotation: .constant(360.0))
        AboutMeButton(showAboutMe: .constant(true), rotation: .constant(360.0))
    }
}
