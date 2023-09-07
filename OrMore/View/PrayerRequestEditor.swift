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
            Form {
                TextField("Request Name", text: $requestName)
                TextField("Request Body", text: $requestBody, axis: .vertical)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(editorTitle)
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        save()
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(requestName == "" || requestBody == "")
                }
            }
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
}
