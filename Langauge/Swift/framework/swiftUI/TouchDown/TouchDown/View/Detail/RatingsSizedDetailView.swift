//
//  RatingsSizedDetailView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct RatingsSizedDetailView: View {
    
    let sizes: [String] = ["XS", "S", "M", "L", "XL"]
    
    var body: some View {
        HStack(alignment: .top, spacing: 3) {
            VStack(alignment: .leading, spacing: 3) {
                Text("Ratings")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
                HStack(alignment: .center, spacing: 3){
                    ForEach(1...5, id: \.self) { item in
                        Button {
                            
                        } label : {
                            Image(systemName: "star.fill")
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(
                                    COLOR_GRAY.cornerRadius(5)
                                )
                                .foregroundColor(.white)
                        }
                    }
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 3){
                Text("Sizes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(COLOR_GRAY)
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5) {
                    ForEach(sizes, id: \.self) { size in
                        Button {
                            
                        } label: {
                            Text(size)
                                .font(.footnote)
                                .fontWeight(.heavy)
                                .foregroundColor(COLOR_GRAY)
                                .frame(width: 28, height: 28, alignment: .center)
                                .background(Color.white.cornerRadius(5))
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(COLOR_GRAY, lineWidth: 2)
                                )
                        }
                    }
                }
            }
        } //: HStack
    }
}

#Preview {
    RatingsSizedDetailView()
}
