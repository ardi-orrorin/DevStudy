//
//  ExplicitView.swift
//  animation
//
//  Created by 유승철 on 1/12/24.
//

import SwiftUI

struct ExplicitView: View {
    
    @State private var redCircle = false
    
    var body: some View {
        Circle()
            .fill(redCircle ? .red : .blue)
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                    redCircle.toggle()
                }
            }
    }
}

#Preview {
    ExplicitView()
}
