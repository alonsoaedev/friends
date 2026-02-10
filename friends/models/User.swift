//
//  User.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var isactive: Bool
    let name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var firends: [Friend]
}
