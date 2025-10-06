//
//  PinkyCursorTeachApp.swift
//  PinkyCursorTeach
//
//  This is the ENTRY POINT - where the app starts! 🚀
//

import SwiftUI

// @main tells iOS "start the app here!"
@main
struct PinkyCursorTeachApp: App {
    
    // Create the brain (ViewModel) for our home screen
    // We create it here so it lives as long as the app is open
    let homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            // Show our HomeView instead of ContentView
            HomeView(viewModel: homeViewModel)
        }
    }
}

// 🎓 LESSON - What is @main?
// It tells iOS: "When someone opens this app, START HERE!"
// Like the front door of a house 🚪
//
// 🎓 LESSON - What is WindowGroup?
// It's a container that holds your app's screens
// On iPhone, it's usually one window
// On iPad/Mac, you might have multiple windows
