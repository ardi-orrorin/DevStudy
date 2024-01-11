//
//  OverayView.swift
//  Draw
//
//  Created by 유승철 on 1/11/24.
//

import SwiftUI

struct OverlayView: View {
    var body: some View {
        Ellipse()
            .fill(.red)
            .overlay {
                Ellipse()
                    .stroke(.blue, lineWidth: 10)
            }
            .frame(width: 250, height: 150)
    }
}

#Preview {
    OverlayView()
}
