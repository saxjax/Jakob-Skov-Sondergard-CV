//
//  TitleView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

struct TitleView: View {
  let title:String
  var body: some View {
    Text(title)
      .font(.title)
      .foregroundColor(Color("TextColorSubHeading"))
  }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
      TitleView(title: "This is the title")
    }
}
