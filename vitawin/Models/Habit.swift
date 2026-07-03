//
//  Habit.swift
//  vitawin
//
//  Created by Azeem on 02/07/26.
//

import Foundation
import SwiftData

@Model
final class Habit {
    var id: UUID
    var habit: String
    var emoji: String
    var createdDate: Date
    var completionDates: [Date]?
    
    init(
        id: UUID = UUID(),
        habit: String,
        emoji: String,
        createdDate: Date = Date(),
        completionDates: [Date] = []
    ) {
        self.id = id
        self.habit = habit
        self.emoji = emoji
        self.createdDate = createdDate
        self.completionDates = completionDates
    }
    
    var isCompletedToday: Bool {
        (completionDates ?? []).contains { Calendar.current.isDateInToday($0) }
    }
    
    func toggleCompletion() {
        var currentDates = completionDates ?? []
        if currentDates.contains(where: { Calendar.current.isDateInToday($0) }) {
            currentDates.removeAll { Calendar.current.isDateInToday($0) }
        } else {
            currentDates.append(Date())
        }
        completionDates = currentDates
    }
    
    var currentStreak: Int {
        let calendar = Calendar.current
        let uniqueDates = Set((completionDates ?? []).map { calendar.startOfDay(for: $0) })
        let sortedDates = uniqueDates.sorted(by: >)
        
        guard !sortedDates.isEmpty else { return 0 }
        
        let today = calendar.startOfDay(for: Date())
        let yesterday = calendar.date(byAdding: .day, value: -1, to: today)!
        
        guard sortedDates[0] == today || sortedDates[0] == yesterday else {
            return 0
        }
        
        var streak = 0
        var checkDate = sortedDates[0]
        
        for date in sortedDates {
            if date == checkDate {
                streak += 1
                checkDate = calendar.date(byAdding: .day, value: -1, to: checkDate)!
            } else {
                break
            }
        }
        
        return streak
    }
}
