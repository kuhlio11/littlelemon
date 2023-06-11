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

struct Onboarding: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack {
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
            }
            
            Button("Login") {
                // OPTIONAL: FOr additional security, add a check to verify the email is valid.
                if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                    UserDefaults.standard.set(firstName, forKey: kFirstName)
                    UserDefaults.standard.set(lastName, forKey: kLastName)
                    UserDefaults.standard.set(email, forKey: kEmail)
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
