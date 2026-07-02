//
//  ContentView.swift
//  vitawin
//
//  Created by Azeem on 02/07/26.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
