//
//  HomeView.swift
//  Restart
//
//  Created by 유승철 on 1/17/24.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingVeiwActive: Bool = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Home")
                .font(.largeTitle)
            
            Button(action: {
                isOnboardingVeiwActive = true
            }, label: {
                Text("ReStart")
            })
        } //: VStack
        
    }
}

#Preview {
    HomeView()
}
