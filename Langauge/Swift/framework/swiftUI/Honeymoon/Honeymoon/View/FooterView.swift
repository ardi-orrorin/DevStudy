//
//  FooterView.swift
//  Honeymoon
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button {
                
            } label: {
                textBtnLabel(text: "Book Destination", color: .pink)
            }
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        } //: hstack
    }
    
    private func textBtnLabel(text: String, color: Color) -> some View {
        Text(text.uppercased())
            .font(.system(.subheadline, design: .rounded))
            .fontWeight(.heavy)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .accentColor(color)
            .background(
                Capsule().stroke(color, lineWidth: 2)
            )
    }
}

#Preview {
    FooterView()
}
