//
//  ControlImageView.swift
//  PinchApp
//
//  Created by 유승철 on 1/20/24.
//

import SwiftUI

struct ControlImageView: View {
    let icon: String
    var body: some View {
        Image(systemName: icon)
            .font(.system(size: 36))
    }
}

//#Preview {
//    ControlImageView()
//}
