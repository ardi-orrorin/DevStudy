//
//  ContentView.swift
//  AsyncImage
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self.resizable()
            .scaledToFit()
            .frame(maxWidth: 100)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    private var imageURL: String = "https://img.danawa.com/prod_img/500000/072/816/img/17816072_1.jpg"
    
    var body: some View {
        VStack {
            
            // 1.basic
//            AsyncImage(url: URL(string: imageURL))
            
            // 2. scale : 큰 값일 수록 작아짐
//            AsyncImage(url: URL(string: imageURL), scale: 2.0)
            
            // 3. placeholder
            /*
            AsyncImage(url: URL(string: imageURL)) { image in
                image.imageModifier()
                    
            } placeholder: {
                Image(systemName: "photo.circle.fill")
                    .iconModifier()
            }
            .padding(40)
            */
            // 4. phase
            /*
            AsyncImage(url: URL(string: imageURL)) { phase in
                if let image = phase.image {
                    image.imageModifier()
                } else if phase.error != nil {
                    Image(systemName: "ant.circle.fill").iconModifier()
                } else {
                    Image(systemName: "photo.circle.fill").iconModifier()
                }
            }
            */
            
            // 5. animation
            AsyncImage(url: URL(string: imageURL), 
                       transaction: Transaction(
                        animation: .spring(response: 0.5 ,
                                           dampingFraction: 0.6,
                                           blendDuration: 0.5
                                          )
                       )
            ){ phase in
                switch phase {
                case .success(let image):
                    image.imageModifier()
//                        .transition(.move(edge: .bottom))
//                        .transition(.scale)
                case .failure(_):
                    Image(systemName: "ant.circle.fill").iconModifier()
                case .empty:
                    Image(systemName: "photo.circle.fille").iconModifier()
                @unknown default:
                    ProgressView()
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
