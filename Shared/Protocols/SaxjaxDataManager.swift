//
//  SaxjaxDataManager.swift
//  Jakob Skov Sondergard CV
//
//  Created by Jakob Skov Søndergård on 13/08/2022.
//

import Foundation
protocol SaxjaxDataManager {
  func storeDataToDataStore(email:String?, password:String?, dataIdentifier:String?, data:Codable?)
  func fetchData(uniqueIdentifier:String)
  func deleteData(uniqueIdentifier:String)
}
