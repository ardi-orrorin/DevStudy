//
//  RipeningModel.swift
//  Avocado
//
//  Created by 유승철 on 2/6/24.
//

import SwiftUI

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
