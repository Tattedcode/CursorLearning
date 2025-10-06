//
//  HomeViewModel.swift
//  PinkyCursorTeach
//
//  This is the BRAIN of the Home Screen
//  It handles all the logic and manages the data
//

import Foundation
import SwiftUI

// MARK: - Home ViewModel
// @Observable makes SwiftUI watch this class for changes
// When something changes here, the screen updates automatically! ✨
@Observable
final class HomeViewModel {
    
    // MARK: - Properties (the data this brain manages)
    
    var user: User
    var dailyProgress: DailyProgress
    var achievements: [Achievement]
    var currentStreak: Int
    
    // MARK: - Initialization
    // This runs when we create a new HomeViewModel
    // It sets up all the starting values
    init() {
        // Debug log so we can see when this happens
        print("🧠 HomeViewModel initialized")
        
        // Create a default user named "Henry"
        self.user = User(name: "Henry")
        
        // Start with today's progress (0 checks done, goal is 3)
        self.dailyProgress = DailyProgress(checksCompleted: 0, dailyGoal: 3)
        
        // Load sample achievements
        self.achievements = Achievement.sampleAchievements
        
        // Start with a streak of 0
        self.currentStreak = 0
    }
    
    // MARK: - Actions (things the user can do)
    
    /// This runs when the user taps "I Fixed My Finger" button
    func markFingerFixed() {
        // Debug log to see when button is pressed
        print("✅ User marked finger as fixed!")
        
        // Add 1 to today's checks
        dailyProgress.checksCompleted += 1
        
        // If this was the first check ever, unlock the "First Step" achievement
        if dailyProgress.checksCompleted == 1 && !achievements[0].isUnlocked {
            achievements[0].isUnlocked = true
            print("🏆 Achievement unlocked: First Step!")
        }
        
        // Check if goal is completed
        if dailyProgress.isGoalComplete {
            print("🎉 Daily goal completed!")
            // TODO: Add streak increment logic here later
        }
    }
    
    /// Get a greeting based on time of day
    func getGreeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        // Morning: 5am-12pm, Afternoon: 12pm-5pm, Evening: 5pm-9pm, Night: 9pm-5am
        switch hour {
        case 5..<12:
            return "Good Morning"
        case 12..<17:
            return "Good Afternoon"
        case 17..<21:
            return "Good Evening"
        default:
            return "Hello"
        }
    }
}

// 🎓 LESSON - What is @Observable?
// 
// Imagine you're watching TV 📺:
// - The TV show (@Observable class) is playing
// - Your eyes (SwiftUI View) are watching the TV
// - When the TV changes channels, your eyes see it immediately!
//
// That's what @Observable does - it tells SwiftUI "watch this for changes!"
//
// OLD way (don't use): @StateObject, @ObservedObject
// NEW way (use this!): @Observable with 'let' in the view
//
// 🎓 LESSON - What is 'final class'?
// - 'class' = A reference type (like a person - there's only ONE of them)
// - 'struct' = A value type (like a photocopy - you can make copies)
// - 'final' = No one can inherit from this class (keeps it simple)
//
// 🎓 LESSON - What is '+='?
// It's a shortcut! Instead of writing:
//   dailyProgress.checksCompleted = dailyProgress.checksCompleted + 1
// We can write:
//   dailyProgress.checksCompleted += 1

