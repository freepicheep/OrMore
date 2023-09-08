//
//  PrayerRequestsView.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/7/23.
//

import SwiftUI
import SwiftData
import Neumorphic

struct PrayerRequestsView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var users: [User]
    @Query private var prayerRequests: [PrayerRequest]
    
    @State private var showingAddItemView: Bool = false

    var body: some View {
        ZStack {
            Color.Neumorphic.main
                .ignoresSafeArea()
            
            NavigationStack {
                ZStack {
                    Color.Neumorphic.main
                        .ignoresSafeArea()
                    
                    // List of prayer requests
                    VStack {
                        ForEach(prayerRequests) { prayerRequest in
                            HStack {
                                NavigationLink(destination: PrayerRequestView(prayerRequest: prayerRequest)) {
                                    Text(prayerRequest.requestName)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background {
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.Neumorphic.main).softOuterShadow()
                                            .padding(.horizontal)
                                    }
                                }
                                Spacer()
                            }
                        }
                        Spacer()
                    }
                    .toolbar {
                        ToolbarItem {
                            Button {
                                showingAddItemView.toggle()
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Prayer Requests")
            .sheet(isPresented: $showingAddItemView) {
                PrayerRequestEditor(prayerRequest: nil)
            }
            .foregroundStyle(Color.Neumorphic.secondary)
        }
    }
}

#Preview {
    PrayerRequestsView()
        .modelContainer(for: PrayerRequest.self, inMemory: true)
}
