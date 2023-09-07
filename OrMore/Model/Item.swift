//
//  Item.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
