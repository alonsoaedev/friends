//
//  Friend.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import Foundation

struct Friend: Codable, Identifiable, Hashable {
    var id = UUID()
    let name: String
}
