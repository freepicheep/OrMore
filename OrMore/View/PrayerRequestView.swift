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
        ZStack {
            Color.Neumorphic.main
                .ignoresSafeArea()
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
                    .fill(Color.Neumorphic.main).softInnerShadow(RoundedRectangle(cornerRadius: 20), spread: 0.15, radius: 2)
            }
        }
    }
}

#Preview {
    PrayerRequestView(prayerRequest: PrayerRequest(createdDate: Date(), requestName: "Pray for Bob", requestBody: "Bob needs Jesus"))
}
