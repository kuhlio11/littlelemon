//
//  Home.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/11/23.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView {
            Menu().tabItem {
                Label("Menu", systemImage: "list.dash")
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
