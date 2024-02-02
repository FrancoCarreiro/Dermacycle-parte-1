//
//  Dermacycle2App.swift
//  Dermacycle2
//
//  Created by Franco Carreiro Eugenio on 22/01/2024.
//

import SwiftUI

@main
struct FirebaseTestApp: App {
    @StateObject var viewModelAuth = AuthViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModelAuth)
        }
    }
}

