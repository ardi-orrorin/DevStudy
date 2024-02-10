//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
        
    }
}
