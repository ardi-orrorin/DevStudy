//
//  EnvironmentObject.swift
//  State
//
//  Created by 유승철 on 12/29/23.
//

import Foundation
import Combine

class SpeedSetting: ObservableObject {
    @Published var speed: Double = 0.0
}
