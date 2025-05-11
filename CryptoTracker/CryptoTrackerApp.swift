//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Zulfikar Noorfan on 06/05/25.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView().toolbar(.hidden)
            }
            .environmentObject(vm)
        }
    }
}
