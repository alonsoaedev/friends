//
//  ContentView.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
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
            .navigationTitle("Friends")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .task {
                await fetchUsers()
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
    
    func fetchUsers() async {
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
            users = decodedUsers
        } catch {
            print("Failed to fetch users")
            return
        }
    }
}

#Preview {
    ContentView()
}
