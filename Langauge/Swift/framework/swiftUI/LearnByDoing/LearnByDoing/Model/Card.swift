//
//  Card.swift
//  LearnByDoing
//
//  Created by 유승철 on 2/2/24.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID();
    var title: String
    var headline: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
