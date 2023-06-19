//
//  Home.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/11/23.
//

import SwiftUI

struct Home: View {

    let persistence = PersistenceController.shared
    
    var body: some View {
        NavigationStack {
            TabView {
                Menu().environment(\.managedObjectContext, persistence.container.viewContext).tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                UserProfile().tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationBar()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}