

# 📱 Pinky Finger Fix – Requirements Document

You are an expert SwiftUI teacher and senior developer.
I am a completely new to Coding and Cursor, i want you to teach me everything and explain all the steps like i am 10 years old.
I want you to explain every part, such as what @State is, why we use it, when we use it and how we use etc.
I want you to comment on all the code so i can read it clear and understand what it all does.
I want you to quiz me and ask me questions about what you have taught me, and make me write some code for you to see if i have done it correctly.


## 1. App Overview  
This app helps people keep their little finger healthy after too much phone use. It makes the process fun with reminders, simple exercises, streaks, rewards, and progress tracking.

---

## 2. Main Goals  
1. Remind users to check their finger during the day.  
2. Teach users short exercises to reduce pain and strain.  
3. Track streaks and progress to keep users motivated.  
4. Make it fun with coins, levels, and rewards.  
5. Let users set custom goals and see charts of their progress.

---

## 3. User Stories  

- **US-001**: As a user, I want reminders during the day so that I don’t forget to check my finger.  
- **US-002**: As a user, I want to press a button to mark “I fixed my finger” so that I feel accountable.  
- **US-003**: As a user, I want to do short finger exercises so that I can reduce strain.  
- **US-004**: As a user, I want a streak counter so that I can stay motivated.  
- **US-005**: As a user, I want to see stats and charts so that I can track my improvement.  
- **US-006**: As a user, I want to earn coins and levels so that I stay engaged.  
- **US-007**: As a user, I want to set custom goals so that I can focus on what matters to me.

---

## 4. Features  

- **F-001 Daily Reminders**  
  - What it does: Sends push notifications at chosen times.  
  - When: Morning, lunch, evening (default) or user-chosen.  
  - Error case: If notifications are off, show a warning message in the app.  

- **F-002 Finger Check Button**  
  - What it does: User taps “I fixed my finger.”  
  - When: After a reminder or anytime on home screen.  
  - Error case: If tap doesn’t save, show retry option.  

- **F-003 Simple Exercises**  
  - What it does: Shows 1–3 minute finger workouts with animation or video.  
  - When: User selects “Exercises” tab.  
  - Error case: If video doesn’t load, show text instructions.  

- **F-004 Streak Counter**  
  - What it does: Shows days in a row user logged checks.  
  - When: Home screen.  
  - Error case: If missed, reset streak and encourage restart.  

- **F-005 Progress Stats**  
  - What it does: Weekly stats (checks done, exercises finished, longest streak).  
  - When: Progress screen.  
  - Error case: If no data yet, show “Start today!”  

- **F-006 Gamification**  
  - What it does: Gives coins/XP for finishing reminders and exercises. Unlocks levels.  
  - When: After completing task.  
  - Error case: If reward doesn’t show, retry and show apology message.  

- **F-007 Custom Goals**  
  - What it does: User sets goals like “Do 2 checks per day.”  
  - When: In settings/goals screen.  
  - Error case: If save fails, show error and retry.  

- **F-008 Charts & Analytics**  
  - What it does: Weekly graph of checks vs. missed reminders.  
  - When: In progress screen.  
  - Error case: If no data, show empty chart with tips.

---

## 5. Screens  

- **S-001 Home Screen**  
  - Shows streak, quick “I fixed my finger” button, and today’s progress.  
  - You get here when you open the app.  

- **S-002 Reminder Settings**  
  - Lets user pick times for reminders.  
  - You get here from Settings.  

- **S-003 Exercise Screen**  
  - Shows list of exercises with video/animation and timers.  
  - You get here from Home or bottom tab.  

- **S-004 Progress Screen**  
  - Shows charts, stats, and history.  
  - You get here from bottom tab.  

- **S-005 Goals & Rewards Screen**  
  - Shows custom goals, coins, and levels.  
  - You get here from bottom tab.  

- **S-006 Settings Screen**  
  - User sets reminders, notifications, and app preferences.  
  - You get here from top-right button on Home.

---

## 6. Data  

- **D-001**: List of saved reminders with times.  
- **D-002**: Log of daily “finger checks” with date/time.  
- **D-003**: Log of exercises completed with date/time.  
- **D-004**: Streak count (current and longest).  
- **D-005**: User coins, XP, and level.  
- **D-006**: User custom goals.  
- **D-007**: Weekly stats and history for charts.

---

## 7. Extra Details  

- Needs **push notifications** (for reminders).  
- Data stored on device (no internet required at first).  
- Optional: Sync with iCloud later for backup.  
- Works in dark mode and light mode.  
- No camera or location needed.  
- Built using **Swift, SwiftUI, and MVVM**.  
- Use folders for **Views**, **ViewModels**, **Models**, **Components**, **Utilities**.  

---

## 8. Build Steps  

- **B-001**: Build **S-001 Home Screen** with **F-002 Finger Check Button** and **F-004 Streak Counter**. Store streak in **D-004**.  
- **B-002**: Add **F-001 Daily Reminders** with **S-002 Reminder Settings**. Save to **D-001**.  
- **B-003**: Add **S-003 Exercise Screen** with **F-003 Simple Exercises**, save results in **D-003**.  
- **B-004**: Add **S-004 Progress Screen** with **F-005 Stats** and **F-008 Charts**, using **D-002–D-007**.  
- **B-005**: Add **F-006 Gamification** and **S-005 Rewards Screen**, store in **D-005**.  
- **B-006**: Add **F-007 Custom Goals** in **S-005**, save to **D-006**.  
- **B-007**: Build **S-006 Settings Screen** for reminders, notifications, and preferences.  
- **B-008**: Add polish (dark mode, error messages, animations).     DESIGN

# 🛠️ Cursor Build Instructions for "Pinky Finger Fix" App

## 1. Project Setup
- Create a new **SwiftUI App** project in Xcode.
- Use **MVVM** structure with these folders:
  - **Views** → SwiftUI screens
  - **ViewModels** → Business logic
  - **Models** → Data objects
  - **Components** → Reusable UI parts (buttons, charts, cards)
  - **Utilities** → Helpers (date formatters, notifications, persistence)

---

## 2. Screen Mapping (from Requirements Doc → UI Kit Design)

- **S-001 Home Screen**  
  - Map to "Dashboard / Lessons" style UI in the kit.  
  - Show: streak counter, quick “I fixed my finger” button, today’s progress cards.  
  - Feature links: F-002 (Finger Check), F-004 (Streak), F-005 (Stats Preview).

- **S-002 Reminder Settings**  
  - Use "Settings/Profile" style screen.  
  - Show list of reminder times with edit/add options.  
  - Feature link: F-001 (Daily Reminders).

- **S-003 Exercise Screen**  
  - Map to "Lessons / Course Detail" style screen.  
  - Show exercise list with timers and progress bar (like reading/listening in kit).  
  - Feature link: F-003 (Exercises).

- **S-004 Progress Screen**  
  - Use "Progress / Stats" style with chart (like friends progress screen in kit).  
  - Show weekly stats, streak history, and charts.  
  - Feature link: F-005 (Stats), F-008 (Charts).

- **S-005 Goals & Rewards Screen**  
  - Use "Achievements" style UI.  
  - Show custom goals at top, achievements/levels below.  
  - Feature link: F-006 (Gamification), F-007 (Custom Goals).

- **S-006 Settings Screen**  
  - Map to "Profile/Settings" screen from kit.  
  - Include: reminder settings, dark mode toggle, app info.  

---

## 3. Feature → UI Component Mapping

- **F-001 Daily Reminders** → Notification scheduler (Utilities). Toggle + time picker in Reminder Settings.  
- **F-002 Finger Check Button** → Big primary button (purple) like “Login” button in kit. Saves log to D-002.  
- **F-003 Exercises** → Cards with icon + progress bar (like Reading/Listening cards). Each opens detail with timer/animation.  
- **F-004 Streak Counter** → Circular progress ring (like friends progress). Shows current/longest streak.  
- **F-005 Stats** → List of weekly totals, embedded in Progress Screen.  
- **F-006 Gamification** → Coin counter + level badge, displayed in Goals & Rewards screen.  
- **F-007 Custom Goals** → Form inputs in Goals screen (e.g. "Do X checks per day").  
- **F-008 Charts** → Line/Bar chart component (weekly progress graph).

---

## 4. Data Model Mapping

- **D-001** Reminder list → `[Reminder(id, time, isActive)]`  
- **D-002** Finger checks → `[CheckLog(id, date, time)]`  
- **D-003** Exercises → `[ExerciseLog(id, exerciseId, date, completed)]`  
- **D-004** Streaks → `Streak(current, longest)`  
- **D-005** Gamification → `Gamification(coins, xp, level)`  
- **D-006** Goals → `[Goal(id, title, target, progress)]`  
- **D-007** Stats → Aggregated struct for weekly history.

---

## 5. Build Steps (follow in Cursor)

1. **B-001 Home Screen (S-001)** → Add Finger Check Button (F-002) + Streak Counter (F-004).  
2. **B-002 Reminder Settings (S-002)** → Add Daily Reminders (F-001).  
3. **B-003 Exercise Screen (S-003)** → Add Exercise List + Timer (F-003).  
4. **B-004 Progress Screen (S-004)** → Add Stats + Charts (F-005, F-008).  
5. **B-005 Goals & Rewards (S-005)** → Add Gamification + Custom Goals (F-006, F-007).  
6. **B-006 Settings (S-006)** → Add preferences, reminder management.  
7. **B-007 Utilities** → Add local storage, notification scheduling.  
8. **B-008 Polish** → Add dark mode, animations, error handling.

---

## 6. UI Styling Notes
- Use **dark theme with purple accent** (like in UI Kit).  
- Rounded cards with icons for each feature.  
- Use system SF Symbols for simple icons, custom assets for finger mascot later.  
- Consistent padding/margins as per kit (16–20pt).  

---