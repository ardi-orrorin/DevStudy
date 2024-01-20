//
//  OnboardingView.swift
//  Fructus
//
//  Created by 유승철 on 1/20/24.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    var fruits: [Fruit] = fruitsData
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(0..<fruits.count, id: \.self) { item in
                FuritCardView(fruit: fruits[item])
            }//: LOOP
        } //: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
        
    }
}

// MARK: - PREVIEW
#Preview {
    OnboardingView()
}
