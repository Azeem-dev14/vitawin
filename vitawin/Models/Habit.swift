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
    var completedDate: Date?
    
    init(
        id: UUID = UUID(),
        habit: String,
        emoji: String,
        createdDate: Date = Date(),
        completedDate: Date? = nil
    ) {
        self.id = id
        self.habit = habit
        self.emoji = emoji
        self.createdDate = createdDate
        self.completedDate = completedDate
    }
}
