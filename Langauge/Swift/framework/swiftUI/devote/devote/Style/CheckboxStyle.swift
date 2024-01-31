//
//  CheckboxStyle.swift
//  devote
//
//  Created by 유승철 on 1/31/24.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                .foregroundColor(configuration.isOn ? .pink : .primary)
                .font(.system(size: 30, weight: .semibold, design: .rounded))
                .onTapGesture {
                    configuration.isOn.toggle()
                }
            
            configuration.label
        }
    }
}

#Preview {
    Toggle("Placehodler label", isOn: .constant(true))
        .toggleStyle(CheckboxStyle())
        .padding()
        .previewLayout(.sizeThatFits)
        
}
