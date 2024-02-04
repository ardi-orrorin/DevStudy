//
//  HeaderModel.swift
//  Avocado
//
//  Created by 유승철 on 2/4/24.
//

import SwiftUI

struct Header: Identifiable, Codable {
    var id = UUID()
    var image: String
    var headline: String
    var subheadline: String
}
