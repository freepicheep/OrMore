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
            // List of prayer requests
            List {
                ForEach(prayerRequests) { prayerRequest in
                    NavigationLink {
                        PrayerRequestView(prayerRequest: prayerRequest)
                    } label: {
                        Text(prayerRequest.requestName)
                    }
                }
            }
            
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        showingAddItemView.toggle()
                    } label: {
                        Image(systemName: "plus")
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
