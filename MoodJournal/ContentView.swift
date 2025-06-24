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
                Image(systemName: "house.fill")
                Text("Home")
            }
            .tag(0)
            NavigationStack {
                CalendarView()
            }
            .tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
            }
            .tag(1)
            
            NavigationStack {
                InsightsView()
            }
            .tabItem {
                Image(systemName: "chart.line.uptrend.xyaxis.circle")
                Text("Insights")
            }
            .tag(2)
            
            NavigationStack {
                AccountView()
            }
            .tabItem {
                Image(systemName: "gear")
                Text("Account")
            }
            .tag(3)
        }
        .accentColor(.selectedTab)
        .tint(.selectedTab)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .unselectedTab
            UITabBar.appearance().backgroundColor = .tabTint
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.tabTint]
        })
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
