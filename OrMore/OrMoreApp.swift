//
//  OrMoreApp.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import SwiftUI
import SwiftData

@main
struct OrMoreApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            Person.self,
            User.self,
            PrayerRequest.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
