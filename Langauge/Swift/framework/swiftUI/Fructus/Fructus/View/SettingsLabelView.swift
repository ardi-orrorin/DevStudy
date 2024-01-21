//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct SettingsLabelView: View {
    
    // MARK: PROFERTIES
    var labelText: String
    var labelImage: String
    
    // MARK: BODY
    
    var body: some View {
        HStack {
            Text(labelText.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

#Preview {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
}
