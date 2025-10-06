//
//  HomeView.swift
//  PinkyCursorTeach
//
//  This is the HOME SCREEN - what you see when you open the app
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    // The brain/logic for this screen
    // 'let' because we're using @Observable (not @State!)
    let viewModel: HomeViewModel
    
    // MARK: - Body
    
    // 'body' is what SwiftUI draws on the screen
    // 'some View' means "this returns something visual"
    var body: some View {
        ZStack {
            // MARK: - Background
            // This covers the whole screen with a dark color
            Color(.systemBackground)
                .ignoresSafeArea() // Go all the way to screen edges
            
            // MARK: - Main Content
            VStack(spacing: 30) {
                
                // MARK: - Top Greeting
                greetingSection
                
                // MARK: - Progress Circle
                progressCircleSection
                
                // MARK: - Big Button
                fixFingerButton
                
                // MARK: - Achievements
                achievementsSection
                
                Spacer() // Push everything up
            }
            .padding(.horizontal, 20) // Space on left and right
            .padding(.top, 60) // Space at top
        }
    }
    
    // MARK: - View Components
    // Breaking the screen into smaller pieces makes it easier to read!
    
    /// The greeting at the top ("Hello Henry")
    private var greetingSection: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.getGreeting())
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Text(viewModel.user.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
    }
    
    /// The circular progress indicator in the middle
    private var progressCircleSection: some View {
        VStack(spacing: 20) {
            // The circle showing progress
            ZStack {
                // Background circle (gray)
                Circle()
                    .stroke(Color.gray.opacity(0.2), lineWidth: 20)
                    .frame(width: 200, height: 200)
                
                // Progress circle (colored based on completion)
                Circle()
                    .trim(from: 0, to: viewModel.dailyProgress.progressPercentage)
                    .stroke(
                        LinearGradient(
                            colors: [.purple, .pink, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90)) // Start from top
                
                // Text in the middle showing progress
                VStack(spacing: 8) {
                    Text("\(viewModel.dailyProgress.checksCompleted)")
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Text("of \(viewModel.dailyProgress.dailyGoal)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("checks today")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    /// The big "I Fixed My Finger" button
    private var fixFingerButton: some View {
        Button(action: {
            // What happens when you tap the button
            viewModel.markFingerFixed()
        }) {
            Text("I Fixed My Finger")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(
                    LinearGradient(
                        colors: [.purple, .pink],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .cornerRadius(16)
        }
    }
    
    /// The achievements section at the bottom
    private var achievementsSection: some View {
        VStack(spacing: 16) {
            // Title
            HStack {
                Text("Achievements")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Spacer()
            }
            
            // Achievement cards in a row
            HStack(spacing: 16) {
                ForEach(viewModel.achievements.prefix(3)) { achievement in
                    AchievementCard(achievement: achievement)
                }
            }
        }
    }
}

// MARK: - Achievement Card Component
// A small card showing one achievement
struct AchievementCard: View {
    let achievement: Achievement
    
    var body: some View {
        VStack(spacing: 8) {
            // Icon
            Text(achievement.iconName)
                .font(.system(size: 32))
                .opacity(achievement.isUnlocked ? 1.0 : 0.3)
            
            // Title
            Text(achievement.title)
                .font(.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .opacity(achievement.isUnlocked ? 1.0 : 0.5)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(12)
    }
}

// MARK: - Preview
// This lets you see the screen in Xcode without running the app!
#Preview {
    HomeView(viewModel: HomeViewModel())
}

// 🎓 MEGA LESSON - Understanding SwiftUI Views
//
// 🏗️ What is a View?
// A View is anything you can SEE on screen. Like LEGO blocks! 🧱
//
// 📦 Container Views (hold other views):
// - VStack = Vertical Stack (puts things on top of each other) ⬇️
// - HStack = Horizontal Stack (puts things side by side) ➡️
// - ZStack = Z Stack (puts things on top of each other like layers) 📚
//
// 🎨 Content Views (actual stuff you see):
// - Text = Shows words
// - Button = Something you can tap
// - Circle = A round shape
// - Color = A solid color
//
// ✨ Modifiers (change how things look):
// - .font() = Changes text size/style
// - .foregroundColor() = Changes text color
// - .background() = Adds a background color
// - .cornerRadius() = Makes rounded corners
// - .padding() = Adds space around something
// - .frame() = Sets the size
//
// 🎓 LESSON - What's the difference between VStack, HStack, ZStack?
//
// VStack:           HStack:          ZStack:
// [  Box 1  ]      [Box1][Box2]     [Box2 on top]
// [  Box 2  ]                       [Box1 bottom]
//
// 🎓 LESSON - What is 'some View'?
// It means "this returns something visual, but I don't need to say exactly what"
// It's like saying "I'll bring dessert" instead of "I'll bring chocolate cake"
//
// 🎓 LESSON - What is ForEach?
// It's a loop that creates views for each item in a list
// Like: "For each friend, make a birthday card"
//
// 🎓 LESSON - What is LinearGradient?
// It smoothly blends colors together (like a sunset! 🌅)


