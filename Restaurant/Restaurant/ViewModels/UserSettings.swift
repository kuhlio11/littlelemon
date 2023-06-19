//
//  UserSettings.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/15/23.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var firstName: String {didSet {UserDefaults.standard.set(firstName, forKey: "kFirstName")}}
    @Published var lastName: String {didSet {UserDefaults.standard.set(lastName, forKey: "kLastName")}}
    @Published var email: String {didSet {UserDefaults.standard.set(email, forKey: "kEmail")}}
    @Published var phoneNumber: String {didSet {UserDefaults.standard.set(phoneNumber, forKey: "kPhoneNumber")}}
    
    @Published var isLoggedIn: Bool {didSet {UserDefaults.standard.set(isLoggedIn, forKey: "kIsLoggedIn")}}
    
    @Published var orderStatuses: Bool {didSet {UserDefaults.standard.set(orderStatuses, forKey: "kOrderStatus")}}
    @Published var passwordChanges: Bool {didSet {UserDefaults.standard.set(passwordChanges, forKey: "kPasswordChanges")}}
    @Published var specialOffers: Bool {didSet {UserDefaults.standard.set(specialOffers, forKey: "kSpecialOffers")}}
    @Published var newsletter: Bool {didSet {UserDefaults.standard.set(newsletter, forKey: "kNewsletter")}}
    
    @Published var searchText: String = ""
    
    @Published var filteringStarters: Bool = false
    @Published var filteringMains: Bool = false
    @Published var filteringDesserts: Bool = false
    @Published var filteringDrinks: Bool = false
    

    init() {
        self.firstName = UserDefaults.standard.object(forKey: "kFirstName") as? String ?? ""
        self.lastName = UserDefaults.standard.object(forKey: "kLastName") as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "kEmail") as? String ?? ""
        self.phoneNumber = UserDefaults.standard.object(forKey: "kPhoneNumber") as? String ?? ""
        
        self.isLoggedIn = UserDefaults.standard.object(forKey: "kIsLoggedIn") as? Bool ?? false
        
        self.orderStatuses = UserDefaults.standard.object(forKey: "kOrderStatus") as? Bool ?? false
        self.passwordChanges = UserDefaults.standard.object(forKey: "kPasswordChanges") as? Bool ?? false
        self.specialOffers = UserDefaults.standard.object(forKey: "kSpecialOffers") as? Bool ?? false
        self.newsletter = UserDefaults.standard.object(forKey: "kNewsletter") as? Bool ?? false


    }
}
