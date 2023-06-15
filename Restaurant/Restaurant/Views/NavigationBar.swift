//
//  NavigationBar.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/15/23.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Spacer()
            Image("headerLogo")
                .resizable()
                .scaledToFit()
            Spacer()
            Image("profile-image-placeholder")
                .resizable()
                .scaledToFit()
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
