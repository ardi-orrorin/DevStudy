//
//  AboutAppDto.swift
//  CardComponentView
//
//  Created by 유승철 on 1/14/24.
//

import Foundation
import SwiftUI

struct AboutAppDto: Identifiable {
    var id = UUID()
    var rowLabel: String = ""
    var rowIcon: String = ""
    var rowContent:  String? = nil
    var rowTintColor: Color = .white
    var rowLinkLabel: String? = nil
    var rowLinkDestination: String? = nil
    
    
    init(rowLabel: String, rowIcon: String, rowContent: String? = nil, rowTintColor: Color, rowLinkLabel: String? = nil, rowLinkDestination: String? = nil) {
        self.rowLabel = rowLabel
        self.rowIcon = rowIcon
        self.rowContent = rowContent
        self.rowTintColor = rowTintColor
        self.rowLinkLabel = rowLinkLabel
        self.rowLinkDestination = rowLinkDestination
    }
    
    
}
