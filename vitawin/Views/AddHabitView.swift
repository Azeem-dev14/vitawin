//
//  AddHabitView.swift
//  vitawin
//
//  Created by Azeem on 02/07/26.
//

import SwiftUI
import SwiftData

struct AddHabitView: View {

    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var emoji: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Habit Details") {
                    TextField("Emoji (e.g. 💧)", text: $emoji)
                    TextField("Habit name (e.g. Drank water)", text: $name)
                }
            }
            .navigationTitle("Add Tiny Win")
            .toolbar {
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveHabit()
                    }
                    .disabled(name.trimmingCharacters(in: .whitespaces).isEmpty)
                }
            }
        }
    }

    private func saveHabit() {
        let newHabit = Habit(
            habit: name.trimmingCharacters(in: .whitespaces),
            emoji: emoji.trimmingCharacters(in: .whitespaces).isEmpty ? "⭐" : emoji
        )
        modelContext.insert(newHabit)
        dismiss()
    }
}

#Preview {
    AddHabitView()
        .modelContainer(for: Habit.self, inMemory: true)
}

