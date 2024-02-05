//
//  RecipeModel.swift
//  Avocado
//
//  Created by 유승철 on 2/5/24.
//

import SwiftUI

struct Recipe: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var rating: Int
    var serves: Int
    var preparation: Int
    var cooking: Int
    var instructions: [String]
    var ingredients: [String]
}
