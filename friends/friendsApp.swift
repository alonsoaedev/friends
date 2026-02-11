//
//  friendsApp.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import SwiftData
import SwiftUI

@main
struct friendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
