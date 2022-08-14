//
//  CVContentInitialValues.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 12/08/2022.
//

import Foundation
class CVContentInitialValues:CVContent {

  override convenience init(){
    let content = ConstTexts()
    self.init(constTexts: content)
  }

  override init(constTexts: ConstTexts) {
    super.init(constTexts: constTexts)
  }

  required init(from decoder: Decoder) throws {
    try super.init(from: decoder)
  }
}
