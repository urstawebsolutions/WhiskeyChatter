//
//  WhiskeyChatterApp.swift
//  WhiskeyChatter
//
//  Created by Michael Ursta on 3/29/23.
//

import SwiftUI
import Firebase

@main
struct WhiskeyChatterApp: App {
    init() {
        // Initialize Firebase
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            WCLaunchView()
        }
    }
}
