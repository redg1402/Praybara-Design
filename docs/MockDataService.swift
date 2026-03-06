// MockDataService.swift
// Praybara — Prototype Data Layer
//
// PURPOSE: Provides all data for the prototype frontend.
// When the backend is ready, the developer replaces this service with real API calls.
// Views must NOT be changed when swapping from mock to real — only this layer changes.
//
// SCOPE: Frontend / Design prototype only. No backend, no persistence, no API calls.

import Foundation
import Combine

@MainActor
class MockDataService: ObservableObject {

    static let shared = MockDataService()

    // MARK: - User
    @Published var currentUser: UserProfile = MockUser.rafael
    @Published var streakDays: Int = 7
    @Published var todayCompletedItems: Set<String> = []

    // MARK: - Today
    @Published var todayVerse: BibleVerse = MockBibleContent.verseOfTheDay
    @Published var todayDevotional: DailyDevotional = MockDevotionals.today

    // MARK: - Prayer
    @Published var myPrayers: [PrayerRequest] = MockPrayers.personal
    @Published var communityPrayers: [PrayerRequest] = MockPrayers.community

    // MARK: - Bible
    @Published var activeReadingPlan: ReadingPlan = MockBibleContent.activePlan
    @Published var allReadingPlans: [ReadingPlan] = MockBibleContent.allPlans
    @Published var recentVerses: [BibleVerse] = MockBibleContent.recentVerses
    @Published var currentChapter: BibleChapter = MockBibleContent.todayChapter

    // MARK: - Habits
    @Published var habits: [HabitTracker] = MockHabits.all

    // MARK: - Challenges
    @Published var featuredChallenge: SpiritualChallenge = MockChallenges.featured
    @Published var allChallenges: [SpiritualChallenge] = MockChallenges.all

    // MARK: - Computed

    var completedTodayCount: Int { todayCompletedItems.count }

    var todayProgress: Double {
        let total = habits.count + 1 // habits + devotional
        return total > 0 ? Double(completedTodayCount) / Double(total) : 0
    }

    // MARK: - Habit Actions

    func toggleHabit(_ id: UUID) {
        guard let index = habits.firstIndex(where: { $0.id == id }) else { return }
        let key = id.uuidString
        if todayCompletedItems.contains(key) {
            todayCompletedItems.remove(key)
            habits[index].streak = max(0, habits[index].streak - 1)
        } else {
            todayCompletedItems.insert(key)
            habits[index].streak += 1
        }
    }

    func isHabitCompleted(_ id: UUID) -> Bool {
        todayCompletedItems.contains(id.uuidString)
    }

    // MARK: - Prayer Actions

    func addPrayer(_ prayer: PrayerRequest) {
        myPrayers.insert(prayer, at: 0)
    }

    func markPrayerAnswered(_ id: UUID) {
        guard let index = myPrayers.firstIndex(where: { $0.id == id }) else { return }
        myPrayers[index].isAnswered = true
        myPrayers[index].answeredAt = Date()
    }

    func deletePrayer(_ id: UUID) {
        myPrayers.removeAll { $0.id == id }
    }

    func prayForCommunityRequest(_ id: UUID) {
        guard let index = communityPrayers.firstIndex(where: { $0.id == id }) else { return }
        communityPrayers[index].prayedByCount += 1
    }

    // MARK: - Devotional Actions

    func completeDevotional() {
        todayCompletedItems.insert("devotional")
        todayDevotional.isCompleted = true
        if !todayCompletedItems.contains("streakIncremented") {
            streakDays += 1
            todayCompletedItems.insert("streakIncremented")
        }
    }

    var isDevotionalCompleted: Bool {
        todayCompletedItems.contains("devotional")
    }

    // MARK: - Bible / Reading Plan Actions

    func advanceReadingPlan() {
        if activeReadingPlan.currentDay < activeReadingPlan.totalDays {
            activeReadingPlan.currentDay += 1
        }
    }

    func enrollInPlan(_ plan: ReadingPlan) {
        activeReadingPlan = plan
        if let index = allReadingPlans.firstIndex(where: { $0.id == plan.id }) {
            allReadingPlans[index].currentDay = 1
        }
    }

    // MARK: - Challenge Actions

    func joinChallenge(_ id: UUID) {
        guard let index = allChallenges.firstIndex(where: { $0.id == id }) else { return }
        allChallenges[index].isActive = true
        allChallenges[index].participants += 1
        allChallenges[index].currentDay = 1
        featuredChallenge = allChallenges[index]
    }
}
