//
//  UserProfile.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/12/23.
//

import SwiftUI

struct UserProfile: View {
    
//    let firstName = UserDefaults.standard.string(forKey: kFirstName)
//    let lastName = UserDefaults.standard.string(forKey: kLastName)
//    let email = UserDefaults.standard.string(forKey: kEmail)
    
    @ObservedObject var userSettings = UserSettings()
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Personal Information")
            Text("Avatar")
            HStack(spacing: 40) {
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFit()
                Button("Change") {
                    
                }
                Button("Remove") {
                    
                }
            }
            .frame(height: 90)
            
            Section {
                // OPTIONAL: Add textfields and an update button to modify profile information by modifying UserDefaults
                Text("First name")
                TextField("", text: $userSettings.firstName)
                    .padding(.bottom)
                Text("Last name")
                TextField("", text: $userSettings.lastName)
                    .padding(.bottom)
                Text("Email")
                TextField("", text: $userSettings.email)
                    .padding(.bottom)
                Text("Phone number")
                TextField("", text: $userSettings.phoneNumber)
                    .padding(.bottom)
            }
            
            Section {
                Text("Email notifications")
                Toggle("Order statuses", isOn: $userSettings.orderStatuses)
                    .toggleStyle(CheckboxToggleStyle())
                Toggle("Password changes", isOn: $userSettings.passwordChanges)
                    .toggleStyle(CheckboxToggleStyle())
                Toggle("Special offers", isOn: $userSettings.specialOffers)
                    .toggleStyle(CheckboxToggleStyle())
                Toggle("Newsletter", isOn: $userSettings.newsletter)
                    .toggleStyle(CheckboxToggleStyle())
            }
            
            Button("Log out") {
                UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                self.presentation.wrappedValue.dismiss()
            }
            .padding()
            .foregroundColor(.black)
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .background(Color.yellow)
            .cornerRadius(10)
            .padding(.top)
            
            HStack {
                Spacer()
                Button("Discard changes") {
                    
                }
                Spacer()
                Button("Save changes") {
                    
                }
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
