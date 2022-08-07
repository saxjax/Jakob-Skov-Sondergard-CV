//
//  ProsaCVItemContainerView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 07/08/2022.
//

import SwiftUI

struct ProsaCVItemContainerView: View {
  let CVItemContainerTitle : String
  var CVItemContainerSubTitle: String? = nil
  var containerUrl : String? = nil
  let bodyContent:String

  var body: some View {
    VStack(alignment: .leading) {
      //Title
      TitleView(title:CVItemContainerTitle)
      VStack(alignment: .leading) {
        (CVItemContainerSubTitle != nil) ?
        Text(CVItemContainerSubTitle!) : nil

        if #available(iOS 16.0, *) {
          (containerUrl != nil) ?
          Text(URL(string: containerUrl!) ?? URL(string: "http://saxjax.dk")!, format: .url) : nil
        }
        else {
          (containerUrl != nil) ?
          Text(containerUrl!) : nil
        }
      }
      Divider()
      //Content
      Text(bodyContent)
        .multilineTextAlignment(.leading)
    }
    .padding(.horizontal)
  }
}

struct ProsaCVItemContainerView_Previews: PreviewProvider {
    static var previews: some View {
      ProsaCVItemContainerView(CVItemContainerTitle: "Container title",CVItemContainerSubTitle: "this is the sub title",containerUrl: "http://someurl.dk", bodyContent: "Content in the body")
    }
}
