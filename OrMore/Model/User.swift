//
//  User.swift
//  OrMore
//
//  Created by Friedrich Stoltzfus on 9/6/23.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var username: String
    var dateOfBirth: Date
    var email: String
    var friends: [User] = []
    var contacts: [Person] = []
    
    init(name: String, username: String, dateOfBirth: Date, email: String, friends: [User], contacts: [Person]) {
        self.name = name
        self.username = username
        self.dateOfBirth = dateOfBirth
        self.email = email
        self.friends = friends
        self.contacts = contacts
    }
}
