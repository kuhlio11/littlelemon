//
//  UserProfile.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/12/23.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Personal Information")
                .font(.title)
                .padding()
            
            Image("profile-image-placeholder")
            
            Section {
                // OPTIONAL: Add textfields and an update button to modify profile information by modifying UserDefaults
                HStack {
                    Text(firstName ?? "")
                    Text(lastName ?? "")
                }
                Text(email ?? "")
            }
            .padding()
            
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            .padding()
            .foregroundColor(.black)
            .frame(width: 200)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding(.top)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
