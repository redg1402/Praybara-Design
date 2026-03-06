// MockUser.swift
// Praybara — Mock User Profile Data

import Foundation

struct MockUser {
    static let rafael = UserProfile(
        name: "Rafael",
        spiritualLevel: .leader,
        tradition: .evangelical,
        joinedDate: Calendar.current.date(byAdding: .month, value: -3, to: Date())!,
        streakDays: 7,
        totalPrayerMinutes: 340,
        completedPlans: 2
    )
}
