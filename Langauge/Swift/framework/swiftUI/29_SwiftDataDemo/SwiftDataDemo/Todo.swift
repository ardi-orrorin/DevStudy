//
//  Todo.swift
//  SwiftDataDemo
//
//  Created by 유승철 on 1/14/24.
//

import Foundation
import SwiftData

@Model
class Todo {
    var id = UUID()
    var title: String
    var descriptionText: String
    
    @Attribute(.unique)
    var date: Date
    
    
    init(){
        self.title = ""
        self.descriptionText = ""
        self.date = .now
    }
    
    
    init(title: String, descriptionText: String, date: Date = .now) {
        self.title = title
        self.descriptionText = descriptionText
        self.date = date
    }
}
