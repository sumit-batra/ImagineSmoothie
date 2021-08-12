//
//  ImagineSmoothieApp.swift
//  ImagineSmoothie
//
//  Created by User on 12/08/21.
//

import SwiftUI
import Firebase

@main
struct ImagineSmoothieApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
