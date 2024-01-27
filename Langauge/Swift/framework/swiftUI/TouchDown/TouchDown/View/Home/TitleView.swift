//
//  TitleView.swift
//  TouchDown
//
//  Created by 유승철 on 1/27/24.
//

import SwiftUI

struct TitleView: View {
    // MARK: - properties
    
    // MARK: - body
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Spacer()
            
            
        }//: HStack
        .padding(.horizontal)
        .padding(.top, 15)
        .padding(.bottom, 10)
        
    }
}


// MARK: - preview

#Preview {
    TitleView(title: "Helmet")
}
