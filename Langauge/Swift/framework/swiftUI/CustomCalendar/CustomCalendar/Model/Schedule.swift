//
//  Schedule.swift
//  CustomCalendar
//
//  Created by 유승철 on 2/10/24.
//

import Foundation

struct schedule: Codable, Identifiable {
    var id = UUID()
    var title: String
    var date: String
    var startTime: String
    var endTime: String
    var location: String
    var memo: String
}
