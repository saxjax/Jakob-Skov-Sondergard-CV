//
//  TopPresentationView.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 06/08/2022.
//

import SwiftUI

struct TopPresentationView: View {
  @Binding var rotationAmount:Double
  @Binding var imageName:String
  @Binding var name:String




  var body: some View {
    VStack {
      Image(imageName)
        .resizable().aspectRatio(contentMode: .fill)
        .frame(width: 250, height: 250, alignment: .top)
        .clipShape(Ellipse())
        .overlay(Circle().stroke(Color.green,lineWidth: 3))
        .rotation3DEffect(.degrees(rotationAmount), axis: (x:0.5,y:1,z:0.6))




      Text(name)
        .font(.custom(Constants.FontType.heading, size: 30, relativeTo: .largeTitle))
        .foregroundColor(Color(Constants.TextColors.name))
        .padding(.top)
    }
  }
}

struct TopPresentationView_Previews: PreviewProvider {
  static let imageName="testing_image"
  static let name = "Testing Name"
  static var previews: some View {
    TopPresentationView(rotationAmount: .constant(360.0),imageName: .constant(imageName),name:  .constant(name))
  }
}
