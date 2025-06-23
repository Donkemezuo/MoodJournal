//
//  ContentView.swift
//  MoodJournal
//
//  Created by Pursuit on 6/22/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Text("Home")
            }
            .tag(0)
            NavigationStack {
                CalendarView()
            }
            .tabItem {
                Text("Calendar")
            }
            .tag(1)
            
            NavigationStack {
                InsightsView()
            }
            .tabItem {
                Text("Insights")
            }
            .tag(2)
            
            NavigationStack {
                AccountView()
            }
            .tabItem {
                Text("Account")
            }
            .tag(3)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
