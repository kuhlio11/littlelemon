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
                Text("Welcome to Little Lemon, your local Mediterranean Bistro!")
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                Image("logo")
                    .padding(.vertical)
                
                Spacer()
                
                HStack {
                    Text("First Name: ")
                    TextField("required", text: $firstName)
                        .autocorrectionDisabled(true)
                }
                .padding(.horizontal)
                .frame(width: 350, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                HStack {
                    Text("Last Name: ")
                    TextField("required", text: $lastName)
                        .autocorrectionDisabled()
                }
                .padding(.horizontal)
                .frame(width: 350, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                HStack {
                    Text("Email: ")
                    TextField("required", text: $email)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                }
                .padding(.horizontal)
                .frame(width: 350, height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                
                Spacer()
                
                Button("Login") {
                    // OPTIONAL: FOr additional security, add a check to verify the email is valid.
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        isLoggedIn = true
                        
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                    }
                }
                .font(.title)
                .foregroundColor(.black)
                .frame(width: 250, height: 50)
                .background(Color.yellow)
                .cornerRadius(10)
                
                NavigationLink("", destination: Home(), isActive: $isLoggedIn)
            }
            .padding()
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
