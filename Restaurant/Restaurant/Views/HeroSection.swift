//
//  HeroSection.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/15/23.
//

import SwiftUI

struct HeroSection: View {
    
    @ObservedObject var userSettings = UserSettings()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .foregroundColor(Color("primary2"))
                .font(.displayTitle())
            Text("Chicago")
                .foregroundColor(.white)
                .font(.subTitle())
            HStack {
                Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.regularText())
                Spacer()
                Image("heroImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 130, height: 140)
                    .cornerRadius(10)
            }
            ZStack {
                Color.white.frame(height: 50).cornerRadius(10)
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("", text: $userSettings.searchText)
                        .textInputAutocapitalization(.never)
                }
                .padding()
            }
            
        }
        .padding()
        .background(Color("primary1"))
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection()
    }
}
