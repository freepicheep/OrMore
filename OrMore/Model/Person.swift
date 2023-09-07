//
//  Person.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import Foundation
import SwiftData

@Model
final class Person {
    var name: String
    var age: Int
    var religion: String
    
    init(name: String, age: Int, religion: String) {
        self.name = name
        self.age = age
        self.religion = religion
    }
}
