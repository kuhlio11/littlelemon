//
//  MenuItem.swift
//  Restaurant
//
//  Created by Ryan Kuhl on 6/12/23.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let information: String
    let price: String
    let image: String
    let category: String
}
