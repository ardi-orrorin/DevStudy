//
//  InsetGalleryView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // MARK: PROPERTIES
    let animal: Animal
    
    // MARK: BODY
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { gallery in
                    Image(gallery)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }//: HSTACK
        }//: SCROLL
    }//: BODY
}

#Preview {
    InsetGalleryView(animal: animals[0])
}
