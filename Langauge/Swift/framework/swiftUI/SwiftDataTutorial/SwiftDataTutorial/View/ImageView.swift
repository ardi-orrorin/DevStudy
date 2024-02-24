//
//  ImageView.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/18/24.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    
    var imageUrl: String
    
    var body: some View {
        VStack {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    ImageView(imageUrl: "")
}
