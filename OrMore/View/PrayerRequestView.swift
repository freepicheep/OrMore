//
//  PrayerRequestView.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import SwiftUI
import Neumorphic

struct PrayerRequestView: View {
    @State var prayerRequest: PrayerRequest
    
    var body: some View {
        VStack {
            Text(prayerRequest.requestName)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            Text(prayerRequest.requestBody)
                .font(.body)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(Neumorphic.defaultMainColor).softOuterShadow()
        }
    }
}

#Preview {
    PrayerRequestView(prayerRequest: PrayerRequest(createdDate: Date(), requestName: "Pray for Bob", requestBody: "Bob needs Jesus"))
}
