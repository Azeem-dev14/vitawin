//
//  HabitCardView.swift
//  vitawin
//
//  Created by Azeem on 02/07/26.
//

import SwiftUI

struct HabitCardView: View {
    let habit: Habit
    let isCompleted: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            Text(habit.emoji)
                .font(.system(size: 30))
            
            Text(habit.habit)
                .font(.headline)
            
            Spacer()
            
            Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                .font(.title2)
                .foregroundStyle(isCompleted ? .green : .gray)
        }
        .padding()
        .background(
            isCompleted
            ? Color.green.opacity(0.15)
            : Color(.systemGray6)
        )
        .clipShape(RoundedRectangle(cornerRadius: 14))
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    HabitCardView(
        habit: Habit(habit: "Drink Water", emoji: "💧"),
        isCompleted: false,
        onTap: {}
    )
    .padding()
}
