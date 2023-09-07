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
    @Query private var prayerRequests: [PrayerRequest]
    
    var body: some View {
        ZStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    PrayerRequestsView()
}
