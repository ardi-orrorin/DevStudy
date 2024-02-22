//
//  SubView.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/18/24.
//

import SwiftUI
import SwiftData
import Kingfisher

struct SubView: View {
    
    var photo: PhotoModel
    
    var body: some View {
        VStack(spacing: 40) {
            Text(photo.title)
                .multilineTextAlignment(.center)
            
            KFImage.url(URL(string: photo.thumbnailUrl))
                .frame(width: 150, height: 150)
                .animation(.easeInOut(duration: 0.5))
            
            NavigationLink(destination: ImageView(imageUrl: photo.url)) {
                Text("View")
            }

        }
        
    }
}

#Preview {
    SubView(photo: PhotoModel(albumId: 0, id: 1, title: "", url: "", thumbnailUrl: ""))
}
