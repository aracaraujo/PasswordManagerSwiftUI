//
//  PasswordManagerSwiftApp.swift
//  PasswordManagerSwift
//
//  Created by Arã Araújo on 1/25/23.
//

import SwiftUI
import Firebase

@main
struct PasswordManagerSwiftApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
