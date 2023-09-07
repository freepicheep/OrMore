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
    
    @State private var showingAddItemView: Bool = false

    var body: some View {
        NavigationSplitView {
            ZStack {
                Color.Neumorphic.main
                    .ignoresSafeArea()
                
                // List of prayer requests
                VStack {
                    ForEach(prayerRequests) { prayerRequest in
                        HStack {
                            NavigationLink {
                                PrayerRequestView(prayerRequest: prayerRequest)
                            } label: {
                                Text(prayerRequest.requestName)
                                    .padding()
                            }
                            .padding()
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.Neumorphic.main).softOuterShadow()
                                .padding()
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
        } detail: {
            Text("Select an item")
        }
        .navigationTitle("Prayer Requests")
        .sheet(isPresented: $showingAddItemView) {
            PrayerRequestEditor(prayerRequest: nil)
        }
        .foregroundStyle(Color.Neumorphic.secondary)
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: PrayerRequest.self, inMemory: true)
}
