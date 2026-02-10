//
//  Friend.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id = UUID()
    let name: String
}
