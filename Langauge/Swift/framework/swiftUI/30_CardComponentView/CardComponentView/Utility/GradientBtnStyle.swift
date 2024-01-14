//
//  GradientBtnStyle.swift
//  CardComponentView
//
//  Created by 유승철 on 1/14/24.
//

import Foundation
import SwiftUI

struct GrradientBtn : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                
                configuration.isPressed ?
                LinearGradient(
                    colors: [
                        .customGrayMedium,
                        .customGrayLight,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                :
                LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(40)
    }
}
