//
//  Achievement.swift
//  PinkyCursorTeach
//
//  This defines what an achievement/trophy is
//

import Foundation

// MARK: - Achievement Model
// Like trophies or badges you earn in games!
struct Achievement: Identifiable, Codable {
    let id: UUID
    let title: String          // Name like "Champion" or "7-Day Streak"
    let description: String    // What you did to earn it
    let iconName: String       // The emoji or symbol to show
    var isUnlocked: Bool       // Did you earn it yet?
    
    // Creates a new achievement
    init(
        id: UUID = UUID(),
        title: String,
        description: String,
        iconName: String,
        isUnlocked: Bool = false
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.iconName = iconName
        self.isUnlocked = isUnlocked
    }
}

// MARK: - Sample Achievements
// These are the achievements we'll show in the app
extension Achievement {
    // 'static' means these belong to Achievement itself, not one specific achievement
    // Think of it like a recipe book (static) vs one specific cake (instance)
    static let sampleAchievements: [Achievement] = [
        Achievement(
            title: "First Step",
            description: "Complete your first finger check",
            iconName: "🏆",
            isUnlocked: false
        ),
        Achievement(
            title: "Week Warrior",
            description: "7-day streak completed",
            iconName: "🎖️",
            isUnlocked: false
        ),
        Achievement(
            title: "Dedication",
            description: "30-day streak completed",
            iconName: "🌟",
            isUnlocked: false
        )
    ]
}

// 🎓 LESSON:
// - 'extension' = Adds extra stuff to something we already created
// - 'static' = Belongs to the type itself, not individual instances
// - '[Achievement]' = An array (list) of achievements


