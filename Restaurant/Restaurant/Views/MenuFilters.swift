//
//  MenuFilters.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/15/23.
//

import SwiftUI

struct MenuFilters: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack {
            Text("ORDER FOR DELIVERY!")
                .font(.sectionTitle())
            HStack {
                Button(action: { userSettings.filteringStarters.toggle()}, label: {
                    Text("Starters")
                        .fontWeight(.bold)
                        .foregroundColor(!userSettings.filteringStarters ? Color("primary1") : Color(.white))
                        .padding(12)
                        .background(!userSettings.filteringStarters ? Color("secondary3") : Color("primary1"))
                        .cornerRadius(20)
                })
                Button(action: { userSettings.filteringMains.toggle()}, label: {
                    Text("Mains")
                        .fontWeight(.bold)
                        .foregroundColor(!userSettings.filteringMains ? Color("primary1") : Color(.white))
                        .padding(12)
                        .background(!userSettings.filteringMains ? Color("secondary3") : Color("primary1"))
                        .cornerRadius(20)
                })
                Button(action: { userSettings.filteringDesserts.toggle()}, label: {
                    Text("Desserts")
                        .fontWeight(.bold)
                        .foregroundColor(!userSettings.filteringDesserts ? Color("primary1") : Color(.white))
                        .padding(12)
                        .background(!userSettings.filteringDesserts ? Color("secondary3") : Color("primary1"))
                        .cornerRadius(20)
                })
                Button(action: { userSettings.filteringDrinks.toggle()}, label: {
                    Text("Drinks")
                        .fontWeight(.bold)
                        .foregroundColor(!userSettings.filteringDrinks ? Color("primary1") : Color(.white))
                        .padding(12)
                        .background(!userSettings.filteringDrinks ? Color("secondary3") : Color("primary1"))
                        .cornerRadius(20)
                })
            }
        }
    }
}

struct MenuFilters_Previews: PreviewProvider {
    static var previews: some View {
        MenuFilters()
    }
}
