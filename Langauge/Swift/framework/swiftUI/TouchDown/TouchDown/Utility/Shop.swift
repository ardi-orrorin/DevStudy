//
//  Shop.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProduct: Bool = false
    @Published var selectProduct: Product? = nil
}
