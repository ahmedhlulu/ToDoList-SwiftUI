//
//  ProfileView.swift
//  ToDoList
//
//  Created by Ahmed on 18/06/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                }else {
                    Text("Loaging profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.black)
            .frame(width: 128,height: 128)
            .padding()
        // info
        Spacer()
        VStack(alignment: .leading){
            Text("Name: ")
                .bold()
            Text(user.name)
                .padding(.bottom, 5)
            
            Text("Email: ")
                .bold()
            Text("\(user.email)")
                .padding(.bottom, 5)
            
            Text("Member Since: ")
                .bold()
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
        }
        Spacer()
        //sign out
        TLButton(title: "Sign out", color: .accentColor) {
            viewModel.logout()
        }
        .padding()
        Spacer()
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
