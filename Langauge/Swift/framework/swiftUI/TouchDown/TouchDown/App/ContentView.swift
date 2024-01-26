//
//  ContentView.swift
//  TouchDown
//
//  Created by 유승철 on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        FeaturedTabView()
                            .frame(height: 230)
                            .padding(.vertical, 20)
                                                
                        FooterView()
                            .padding(.horizontal)
                    }//: vstack
                    
                } //: scrollview
            }//: VStack
            .background(COLOR_BACKGROUND.ignoresSafeArea(.all, edges: .all))
        }//: ZStack
        .ignoresSafeArea(.all, edges: .top)
        
    }
}

// MARK: - preview
#Preview {
    ContentView()
}
