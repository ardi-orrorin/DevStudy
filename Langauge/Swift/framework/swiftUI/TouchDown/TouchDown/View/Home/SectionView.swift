//
//  SectionView.swift
//  TouchDown
//
//  Created by 유승철 on 1/27/24.
//

import SwiftUI

struct SectionView: View {
    
    @State var rotateClockWise: Bool
    
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text("Categories".uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .rotationEffect(Angle(degrees: rotateClockWise ? 90 :  -90))
            
            Spacer()
        }
        .background(COLOR_GRAY.cornerRadius(12))
        .frame(width: 85)
    }
}

#Preview {
    SectionView(rotateClockWise: false)
        .previewLayout(.fixed(width: 120, height: 240))
        .padding()
    
}
