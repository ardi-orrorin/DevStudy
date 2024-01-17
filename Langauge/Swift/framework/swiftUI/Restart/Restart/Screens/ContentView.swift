//
//  ContentView.swift
//  Restart
//
//  Created by 유승철 on 1/17/24.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingVeiwActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingVeiwActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
