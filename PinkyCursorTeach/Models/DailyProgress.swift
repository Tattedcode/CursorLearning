//
//  DailyProgress.swift
//  PinkyCursorTeach
//
//  This tracks how many times you've checked your finger today
//

import Foundation

// MARK: - Daily Progress Model
// This keeps track of what you did today
struct DailyProgress: Codable {
    // How many times you pressed "I Fixed My Finger" today
    var checksCompleted: Int
    
    // Your goal for today (like "I want to fix my finger 3 times today")
    var dailyGoal: Int
    
    // What day is this for?
    var date: Date
    
    // Creates progress for today with default values
    init(checksCompleted: Int = 0, dailyGoal: Int = 3, date: Date = Date()) {
        self.checksCompleted = checksCompleted
        self.dailyGoal = dailyGoal
        self.date = date
    }
    
    // 📊 Calculate progress percentage (0.0 to 1.0)
    // This tells us "how much of today's goal is done?"
    var progressPercentage: Double {
        guard dailyGoal > 0 else { return 0 }
        return min(Double(checksCompleted) / Double(dailyGoal), 1.0)
    }
    
    // ✅ Check if today's goal is completed
    var isGoalComplete: Bool {
        return checksCompleted >= dailyGoal
    }
}

// 🎓 LESSON:
// - 'Date()' = Right now (today's date and time)
// - 'Double' = A number with decimals (like 0.67)
// - 'guard' = A safety check ("if this is wrong, stop!")
// - 'min()' = Picks the smaller number (so we never go over 100%)


