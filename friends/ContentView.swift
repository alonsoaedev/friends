//
//  ContentView.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.company)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Text(user.isActive ? "Active" : "Inactive")
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Friends \(users.count)")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .toolbar {
                Button("Delete All", systemImage: "trash", role: .destructive) {
                    try? modelContext.delete(model: User.self)
                }
            }
            .task {
                if users.isEmpty {
                    await fetchUsers(storedIn: modelContext)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
    
    func fetchUsers(storedIn: ModelContext) async {
        print("Fetching users...")
        let urlString = "https://www.hackingwithswift.com/samples/friendface.json"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let decodedUsers = try? JSONDecoder().decode([User].self, from: data) else {
                print("Failed to decode users")
                return
            }
            
            for user in decodedUsers {
                storedIn.insert(user)
            }
        } catch {
            print("Failed to fetch users")
            return
        }
    }
}

#Preview {
    ContentView()
}
