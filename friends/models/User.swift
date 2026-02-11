//
//  User.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import Foundation
import SwiftData

@Model
class User: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id, isActive, name, age, company, email, address, about, registered, tags, friends
    }
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    init(name: String, age: Int, address: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = UUID()
        self.isActive = false
        self.name = name
        self.age = age
        self.company = ""
        self.email = ""
        self.address = address
        self.about = ""
        self.registered = .now
        self.tags = []
        self.friends = [
            Friend(name: "Alonso Acosta"),
            Friend(name: "Jessica S. Espinosa")
        ]
    }
    
    init(isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = UUID()
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
        
        // special handling
        let strDate = try container.decode(String.self, forKey: .registered)
        self.registered = try Date(strDate, strategy: .iso8601)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(address, forKey: .address)
        try container.encode(about, forKey: .about)
        try container.encodeIfPresent(registered, forKey: .registered)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(friends, forKey: .friends)
    }
}
