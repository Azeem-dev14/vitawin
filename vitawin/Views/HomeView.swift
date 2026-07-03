//
//  HomeView.swift
//  vitawin
//
//  Created by Azeem on 02/07/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var habits: [Habit]
//    @State private var habits: [Habit] = [
//        Habit(habit: "Drink Water", emoji: "💧"),
//        Habit(habit: "Read One Page", emoji: "📖"),
//        Habit(habit: "Walk 5 Minutes", emoji: "🚶")
//    ]
    

    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                
                // Header
                VStack(alignment: .leading, spacing: 4) {
                    Text("Vitawin")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(Date.now.formatted(date: .complete, time: .omitted))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
                // Habits
                if habits.isEmpty {
                    Spacer()
                    ContentUnavailableView(
                        "No Habits Yet",
                        systemImage: "checklist",
                        description: Text("Tap the + button to add your first habit.")
                    )
                } else {
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(habits) { habit in
                                let completed = habit.completedDate != nil
                                HabitCardView(habit: habit, isCompleted: completed) {
                                    if completed {
                                        habit.completedDate = nil
                                    } else {
                                        habit.completedDate = Date()
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay(alignment: .bottomTrailing) {
                NavigationLink {
                    AddHabitView()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
        .modelContainer(for: Habit.self, inMemory: true)
}
