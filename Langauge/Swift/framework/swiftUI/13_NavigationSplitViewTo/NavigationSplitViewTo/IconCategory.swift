//
//  IconCategory.swift
//  NavigationSplitViewTo
//
//  Created by 유승철 on 1/7/24.
//

import Foundation


struct IconCategory: Identifiable, Hashable {
    let id = UUID()
    let categoryName: String
    let images: [String]
}
