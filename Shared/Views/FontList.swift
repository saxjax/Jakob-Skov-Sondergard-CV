//
//  FontList.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI

struct FontList: View {
    let allFontNames = UIFont.familyNames
        .flatMap { UIFont.fontNames(forFamilyName: $0) }

    var body: some View {
        List(allFontNames, id: \.self) { name in
            Text(name)
                .font(Font.custom(name, size: 12))
        }
    }
}

struct FontList_Previews: PreviewProvider {
    static var previews: some View {
        FontList()
            .previewDevice("iPad (9th generation)")
    }
}
