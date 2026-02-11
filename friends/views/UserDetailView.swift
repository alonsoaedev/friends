//
//  UserDetailView.swift
//  friends
//
//  Created by Alonso Acosta on 10/02/26.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        Form {
            Section("Info") {
                HStack {
                    Text("Company")
                        .bold()
                    Spacer()
                    Text(user.company)
                }
                
                HStack {
                    Text("Email")
                        .bold()
                    Spacer()
                    Text(user.email)
                }
                
                HStack {
                    Text("Active")
                        .bold()
                    Spacer()
                    Text(user.isActive ? "Yes" : "No")
                }
                
                VStack(alignment: .leading) {
                    Text("About")
                        .bold()
                    Spacer()
                    Text(user.about)
                }
            }
            
            Section("Freinds") {
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    UserDetailView(
        user: User(
            isActive: false,
            name: "Alford Rodriguez",
            age: 21,
            company: "Imkan",
            email: "alfordrodriguez@imkan.com",
            address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
            about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
            registered: .now,
            tags: [
                "cillum",
                "consequat",
                "deserunt",
                "nostrud",
                "eiusmod",
                "minim",
                "tempor"
            ],
            friends: [
                Friend(name: "Hawkins Patel"),
                Friend(name: "Jewel Sexton"),
                Friend(name: "Berger Robertson"),
            ]
        )
    )
}
