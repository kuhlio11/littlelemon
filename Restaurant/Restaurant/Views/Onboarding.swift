//
//  Onboarding.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/11/23.
//

import SwiftUI
import CoreData

struct Onboarding: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Little Lemon, your favorite Mediterranean Bistro!")
                    .multilineTextAlignment(.center)
                    .font(.title2)
                
                Image("onboardingLogo")
                    .padding(.vertical)
                
                Section {
                    HStack {
                        Text("First Name: ")
                        TextField("required", text: $userSettings.firstName)
                    }
                    HStack {
                        Text("Last Name: ")
                        TextField("required", text: $userSettings.lastName)
                    }
                    HStack {
                        Text("Email: ")
                        TextField("required", text: $userSettings.email)
                            .textInputAutocapitalization(.never)
                    }
                }
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .autocorrectionDisabled()
                .listStyle(.plain)
                                
                Button("Login") {
                    // For extra security - modify the third check to verify that the email is valid before storing the details and navigating to the Home screen
                    if !userSettings.firstName.isEmpty && !userSettings.lastName.isEmpty && !userSettings.email.isEmpty {
                        UserDefaults.standard.set(userSettings.firstName, forKey: "kFirstName")
                        UserDefaults.standard.set(userSettings.lastName, forKey: "kLastName")
                        UserDefaults.standard.set(userSettings.email, forKey: "kEmail")
                        UserDefaults.standard.set(true, forKey: "kIsLoggedIn")
                        userSettings.isLoggedIn = true
                    }
                }
                .buttonStyle(ButtonStyleYellowColorWide())
                .padding(.top)
            }
            .padding(.horizontal)
            .onAppear {
                if UserDefaults.standard.bool(forKey: "kIsLoggedIn") {
                    userSettings.isLoggedIn = true
                }
            }
            .navigationDestination(isPresented: $userSettings.isLoggedIn) {
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
