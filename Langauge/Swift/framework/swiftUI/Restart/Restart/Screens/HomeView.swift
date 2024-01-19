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
            
            // MARK: HEADER
            
            Spacer()
            
            ZStack {
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
            }
            
            // MARK: CENTER
            
            Text("The time that leads to mastery is dependent on the intensity of our focus")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
            // MARK: FOOTER
            
            Spacer()
            
            Button(action: {
                isOnboardingVeiwActive = true
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
            } //: BUTTON
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
            
        } //: VStack
        
    }
}

#Preview {
    HomeView()
}
