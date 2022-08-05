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

        ZStack {
            Color(Constants.TextColors.appBackground)
                .edgesIgnoringSafeArea(.all)
            ScrollView{
                VStack {

                    TopPresentationView(rotationAmount: $rotationAmount)

                    AboutMeButton(showAboutMe: $showAboutMe, rotation: $rotationAmount).rotation3DEffect(.degrees(rotationAmount), axis: (x:1,y:0,z:0))

                    showAboutMe ? AboutMeSectionView(showAboutMe: $showAboutMe, rotationAmount: $rotationAmount) : nil

                    ContactInfoView()
                    Divider()
                    showAboutMe ? nil : JobSectionView()
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



