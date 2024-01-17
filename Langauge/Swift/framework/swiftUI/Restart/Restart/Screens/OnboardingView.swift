//
//  OnboardingView.swift
//  Restart
//
//  Created by 유승철 on 1/17/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var isOnboardingVeiwActive: Bool = true
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button(action : {
                isOnboardingVeiwActive = false
            }) {
                Text("Start")
            }
        } //: VStack
    }
}

#Preview {
    OnboardingView()
}
