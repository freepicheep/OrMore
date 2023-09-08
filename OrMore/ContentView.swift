//
//  ContentView.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import SwiftUI
import SwiftData
import Neumorphic

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @Query private var prayerRequests: [PrayerRequest]

    var body: some View {
        NavigationStack() {
            ZStack {
                Color.Neumorphic.main
                    .ignoresSafeArea()
                NavigationLink(destination: PrayerRequestsView()) {
                    Label("Prayer Requests", systemImage: "list.dash")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.Neumorphic.main).softOuterShadow()
                            .padding(.horizontal)
                    }
                }
            }
        }
        .foregroundStyle(Color.Neumorphic.secondary)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: PrayerRequest.self, inMemory: true)
}
