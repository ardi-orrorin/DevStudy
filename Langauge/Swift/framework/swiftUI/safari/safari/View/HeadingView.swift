//
//  HeadingView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct HeadingView: View {
    
    // MARK: PROPERTIES
    
    var headingImage: String
    var headingText: String
    
    // MARK: BODY
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "wilderness in Pictures")
}
