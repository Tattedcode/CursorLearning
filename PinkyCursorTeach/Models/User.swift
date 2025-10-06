//
//  User.swift
//  PinkyCursorTeach
//
//  This file defines what a USER is in our app
//

import Foundation

// MARK: - User Model
// This is like a blueprint that describes what information we store about a user
struct User: Identifiable, Codable {
    // 'let' means this value never changes once created
    let id: UUID // A unique ID for this user (like a fingerprint)
    
    // 'var' means this value CAN change
    var name: String // The user's name (like "Henry")
    
    // This creates a new user with default values
    // 'UUID()' automatically creates a random unique ID
    init(name: String = "User") {
        self.id = UUID()
        self.name = name
    }
}

// 🎓 LESSON:
// - 'struct' = A container that holds related information
// - 'Identifiable' = Tells SwiftUI this has a unique 'id'
// - 'Codable' = Lets us save this to the phone's storage later
// - 'UUID' = Universally Unique Identifier (a special random ID)


