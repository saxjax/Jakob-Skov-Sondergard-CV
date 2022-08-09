//
//  CVItem.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import Foundation
struct CVItem:Codable {
    let id:Int
    let title:String
    let body:String?
}
