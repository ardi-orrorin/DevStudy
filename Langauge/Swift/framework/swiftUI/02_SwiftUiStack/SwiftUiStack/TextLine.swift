//
//  TextLine.swift
//  SwiftUiStack
//
//  Created by 유승철 on 12/28/23.
//

import SwiftUI

struct TextLine: View {
    var body: some View {
        HStack {
            Image(systemName: "airplane")
            Text("Flight times: ")
            Text("London")
        }
        .font(.largeTitle)
        .lineLimit(1...4) // 줄 제한
        
    }
}

#Preview {
    TextLine()
}
