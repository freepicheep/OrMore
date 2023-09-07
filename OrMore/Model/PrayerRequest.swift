//
//  PrayerRequest.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import Foundation
import SwiftData

@Model
final class PrayerRequest {
    var createdDate: Date
    var requestName: String
    var requestBody: String
    
    init(createdDate: Date, requestName: String, requestBody: String) {
        self.createdDate = createdDate
        self.requestName = requestName
        self.requestBody = requestBody
    }
}
