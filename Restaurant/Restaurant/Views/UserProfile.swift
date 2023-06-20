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
        ScrollView {
            VStack(alignment: .leading) {
                Text("Personal Information")
                    .font(.sectionTitle())
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                
                Text("Avatar")
                    
                HStack(spacing: -10) {
                    Image("profile-image-placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 90)
                        .padding(.trailing)
                    
                    Button("Change") {}
                    .buttonStyle(ButtonStylePrimaryColor1())
                    
                    Button("Remove") {}
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                    
                    Spacer()
                    
                }
                
                Section {
                    // OPTIONAL: Add textfields and an update button to modify profile information by modifying UserDefaults
                    VStack {
                        Text("First name")
                            .font(.onboardingText())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("primary1"))
                            .padding(.bottom, 10)
                        
                        TextField("", text: $userSettings.firstName)
                            .textFieldStyle(.plain)
                            .padding(.leading)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .padding(.vertical, -12)
                                .foregroundColor(.black.opacity(0.1)))
                    }
                    
                    VStack {
                        Text("Last name")
                            .font(.onboardingText())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("primary1"))
                            .padding(.bottom, 10)

                        TextField("", text: $userSettings.lastName)
                            .textFieldStyle(.plain)
                            .padding(.leading)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .padding(.vertical, -12)
                                .foregroundColor(.black.opacity(0.1)))
                    }
                    
                    VStack {
                        Text("Email")
                            .font(.onboardingText())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("primary1"))
                            .padding(.bottom, 10)

                        TextField("", text: $userSettings.email)
                            .textFieldStyle(.plain)
                            .padding(.leading)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .padding(.vertical, -12)
                                .foregroundColor(.black.opacity(0.1)))
                    }
                    
                    VStack {
                        Text("Phone number")
                            .font(.onboardingText())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundColor(Color("primary1"))
                            .padding(.bottom, 10)

                        TextField("", text: $userSettings.phoneNumber)
                            .textFieldStyle(.plain)
                            .padding(.leading)
                            .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(lineWidth: 1)
                                .padding(.vertical, -12)
                                .foregroundColor(.black.opacity(0.1)))
                    }
                }
                .padding(.bottom, 35)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                
                Text("Email notifications")
                    .font(.sectionTitle())
                    .padding(.bottom, 10)
                
                Section {
                    Toggle("Order statuses", isOn: $userSettings.orderStatuses)
                        .toggleStyle(CheckboxToggleStyle())
                    Toggle("Password changes", isOn: $userSettings.passwordChanges)
                        .toggleStyle(CheckboxToggleStyle())
                    Toggle("Special offers", isOn: $userSettings.specialOffers)
                        .toggleStyle(CheckboxToggleStyle())
                    Toggle("Newsletter", isOn: $userSettings.newsletter)
                        .toggleStyle(CheckboxToggleStyle())
                        .padding(.bottom, 30)
                }
                .font(Font.highlightText())
                
                Button("Log out") {
                    UserDefaults.standard.set(false, forKey: "kIsLoggedIn")
                    self.presentation.wrappedValue.dismiss()
                }
                .buttonStyle(ButtonStyleYellowColorWide())
                .padding(.bottom, 30)
                
                HStack(spacing: 0) {
                    Button("Discard changes") {}
                        .buttonStyle(ButtonStylePrimaryColorReverse())
                    Button("Save changes") {}
                        .buttonStyle(ButtonStylePrimaryColor1())
                }
                .padding(.bottom, 50)
            }
            .padding(.horizontal)
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
