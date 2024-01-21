//
//  StartButtonView.swift
//  Fructus
//
//  Created by 유승철 on 1/20/24.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    // MARK: - BODY

    var body: some View {
        Button {
            isOnboarding = false
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }//: HSTACK
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(.white, lineWidth: 1.25)
            )
        }//: BUTTON
        .accentColor(.white)
        
        
    }
}

#Preview {
    StartButtonView()
        .previewLayout(.sizeThatFits)
}
