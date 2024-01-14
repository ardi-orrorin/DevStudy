//
//  CustomBtnView.swift
//  CardComponentView
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI

struct CustomBtnView: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                    colors: [
                        .white,
                        .customGreenLight,
                        .customGreenMedium
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                    )
                )
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium,
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    , lineWidth: 4
                )
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )             
                )
            
        }
        .frame(width: 58, height: 58)
        
    }
}

#Preview {
    CustomBtnView()
        .previewLayout(.sizeThatFits)
        .padding()
    
}
