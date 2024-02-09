//
//  HeaderView.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct HeaderView: View {
    
    
    // MARK: - properties
    
    @Binding var showGuideView: Bool
    @Binding var showinfoView:  Bool
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button {
                showinfoView.toggle()
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            } //: button
            .accentColor(.primary)
            .sheet(isPresented: $showinfoView) {
                InfoView()
            }
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            
            Button {
                showGuideView.toggle()
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            } //: button
            .accentColor(.primary)
            .sheet(isPresented: $showGuideView){
                GuideView()
            }
        }//: hstack
        .padding()
    }
}
