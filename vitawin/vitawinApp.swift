//
//  vitawinApp.swift
//  vitawin
//
//  Created by Azeem on 02/07/26.
//

import SwiftUI
import SwiftData

@main
struct VitawinApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Habit.self)
    }
}
