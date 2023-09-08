//
//  PrayerRequestEditor.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import SwiftUI
import Neumorphic
import SwiftData

struct PrayerRequestEditor: View {
    let prayerRequest: PrayerRequest?
    
    private var editorTitle: String {
        prayerRequest == nil ? "New Prayer Request" : "Edit Prayer Request"
    }
    
    @State private var requestName: String = ""
    @State private var requestBody: String = ""
    @State private var requestDate: Date = Date()
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \PrayerRequest.requestName) private var prayerRequests: [PrayerRequest]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.Neumorphic.main
                    .ignoresSafeArea()
                VStack {
                    TextField("Request Name", text: $requestName)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 10), spread: 0.30, radius: 2)
                                .padding(5)
                        }
                        .padding(.horizontal)
                    TextField("Request Body", text: $requestBody, axis: .vertical)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 10), spread: 0.30, radius: 2)
                                .padding(5)
                        }
                        .padding(.horizontal)
                    Spacer()
                    Button {
                        save()
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .softButtonStyle(RoundedRectangle(cornerRadius: 20))
                    .disabled(requestName == "" || requestBody == "")
                    .padding(.bottom, 60)
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(editorTitle)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
            }
            .foregroundStyle(Color.Neumorphic.secondary)
        }
        .onAppear {
            if let prayerRequest {
                requestName = prayerRequest.requestName
                requestBody = prayerRequest.requestBody
                requestDate = prayerRequest.createdDate
            }
        }
    }
    
    private func save() {
        if let prayerRequest {
            prayerRequest.requestName = requestName
            prayerRequest.requestBody = requestBody
            prayerRequest.createdDate = requestDate
        } else {
            let newPrayerRequest = PrayerRequest(createdDate: requestDate, requestName: requestName, requestBody: requestBody)
            modelContext.insert(newPrayerRequest)
        }
    }
}

#Preview {
    PrayerRequestEditor(prayerRequest: PrayerRequest(createdDate: Date(), requestName: "Pray for Bob", requestBody: "Bob needs Jesus"))
        .modelContainer(for: PrayerRequest.self, inMemory: true)
}
