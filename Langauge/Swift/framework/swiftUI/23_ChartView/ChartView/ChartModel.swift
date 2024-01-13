//
//  ChartModel.swift
//  ChartView
//
//  Created by 유승철 on 1/13/24.
//

import Foundation

struct MonthlyTemp : Identifiable {
    var id = UUID()
    var month: String
    var degrees: Int
}
