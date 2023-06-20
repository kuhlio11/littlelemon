//
//  Styles.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/15/23.
//

import Foundation
import SwiftUI

struct ButtonStyleYellowColorWide: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(configuration.isPressed ? .white : .black)
            .padding(10)
            .background(configuration.isPressed ? Color("primary1") : Color("primary2"))
            .cornerRadius(8)
    }
}

struct ButtonStylePrimaryColor1: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color("primary1") : .white)
            .padding(10)
            .background(configuration.isPressed ? .white : Color("primary1"))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("primary1"), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

struct ButtonStylePrimaryColorReverse: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .white : Color("primary1"))
            .padding(10)
            .background(configuration.isPressed ? Color("primary1") : .white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("primary1"), lineWidth: 1)
            )
            .padding(.horizontal)
    }
}

extension Text {
    func onboardingTextStyle() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("primary1"))
            .font(.custom("Karla-Bold", size: 13))
    }
}

extension Font {
    static func displayTitle() -> Font {return Font.custom("Markazi Text", size: 64).weight(.medium)}
    static func subTitle() -> Font {return Font.custom("Markazi Text", size: 40)}
    static func leadText() -> Font {return Font.custom("Karla", size: 18).weight(.medium)}
    static func regularText() -> Font {return Font.custom("Markazi Text", size: 18)}
    static func sectionTitle() -> Font {return Font.custom("Karla", size: 20).weight(.bold)}
    static func sectionCategories() -> Font {return Font.custom("Karla", size: 16).weight(.heavy)}
    static func paragraphText() -> Font {return Font.custom("Karla", size: 16)}
    static func highlightText() -> Font {return Font.custom("Karla", size: 16).weight(.medium)}
    
    static func onboardingText() -> Font {return Font.custom("Karla-Bold", size: 13)}
}
