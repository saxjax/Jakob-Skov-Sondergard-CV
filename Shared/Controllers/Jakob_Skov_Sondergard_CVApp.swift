//
//  Jakob_Skov_Sondergard_CVApp.swift
//  Shared
//
//  Created by Jakob Skov Søndergård on 05/08/2022.
//

import SwiftUI
import Firebase

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

@main
struct Jakob_Skov_Sondergard_CVApp: App {
//  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  init(){
    FirebaseApp.configure()
    let db = Firestore.firestore()

    print("I got a database!:\(db)\n")
    
  }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
  }


