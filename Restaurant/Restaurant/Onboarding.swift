//
//  Onboarding.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/11/23.
//

import SwiftUI

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "logged in key"

struct Onboarding: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {                
                Section {
                    HStack {
                        Text("First Name: ")
                        TextField("required", text: $firstName)
                    }
                    HStack {
                        Text("Last Name: ")
                        TextField("required", text: $lastName)
                    }
                    HStack {
                        Text("Email: ")
                        TextField("required", text: $email)
                            .textInputAutocapitalization(.never)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .autocorrectionDisabled()
                .listStyle(.plain)
                
                Spacer()
                
                Button("Login") {
                    // For extra security - modify the third check to verify that the email is valid before storing the details and navigating to the Home screen
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                    }
                }
                .padding()
                .foregroundColor(.black)
                .frame(width: 200)
                .background(Color.yellow)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
