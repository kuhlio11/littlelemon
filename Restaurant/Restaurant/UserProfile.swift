//
//  UserProfile.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/11/23.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)

    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.title)
            Image("profile-image-placeholder")
            HStack {
                Text(firstName ?? "")
                Text(lastName ?? "")
            }
            .padding()
            .font(.title2)
            Text(email ?? "")
                .font(.title2)
            
            Spacer()
            
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .font(.title)
            .foregroundColor(.black)
            .frame(width: 250, height: 50)
            .background(Color.yellow)
            .cornerRadius(10)
        }
        .padding()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
