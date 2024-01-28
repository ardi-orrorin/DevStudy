//
//  Constant.swift
//  TouchDown
//
//  Created by 유승철 on 1/25/24.
//

import SwiftUI

// data
let players: [Player] = Bundle.main.decode("player.json")
let categories: [Categroy] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")
let sampleProduct: Product = products[0]

// color
let COLOR_BACKGROUND: Color = Color("ColorBackgrounnd")
let COLOR_GRAY: Color = Color(UIColor.systemGray4)

// layout
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}


// ux

// api

// image

// font

// string

// misc
