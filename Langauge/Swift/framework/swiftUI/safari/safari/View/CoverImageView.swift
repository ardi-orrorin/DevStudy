//
//  CoverImageView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct CoverImageView: View {
    
    // MARK: - PROPERTIES
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    // MARK: - BODY
    
    var body: some View {
        TabView {
            ForEach(coverImages) { cover in
                Image(cover.name)
                    .resizable()
                .scaledToFill()
            }
        }//: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

// MARK: - PREVIEW

#Preview {
    CoverImageView()
//        .frame(width: 400, height: 300)
}
