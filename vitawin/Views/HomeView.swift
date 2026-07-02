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
    
    @State private var completedIDs: Set<UUID> = []
    
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
                                
                                let completed = completedIDs.contains(habit.id)
                                
                                HStack(spacing: 16) {
                                    
                                    Text(habit.emoji)
                                        .font(.system(size: 30))
                                    
                                    Text(habit.habit)
                                        .font(.headline)
                                    
                                    Spacer()
                                    
                                    Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                                        .font(.title2)
                                        .foregroundStyle(completed ? .green : .gray)
                                }
                                .padding()
                                .background(
                                    completed
                                    ? Color.green.opacity(0.15)
                                    : Color(.systemGray6)
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                                .onTapGesture {
                                    if completed {
                                        completedIDs.remove(habit.id)
                                    } else {
                                        completedIDs.insert(habit.id)
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
