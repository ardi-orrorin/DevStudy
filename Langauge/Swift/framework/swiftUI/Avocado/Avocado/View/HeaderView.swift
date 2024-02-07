//
//  HeaderView.swift
//  Avocado
//
//  Created by 유승철 on 2/4/24.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - properties
    
    var header: Header
    
    @State private var showHeadline: Bool = false
    
    var slideInAnimation: Animation {
        Animation
            .spring(
                response: 1.5,
                dampingFraction: 0.5,
                blendDuration: 0.5
            )
            .speed(1)
            .delay(0.25)
    }
    
    
    // MARK: - body
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(header.image)
                .resizable()
                .scaledToFit()
            
            HStack(alignment: .top, spacing: 0){
                Rectangle()
                    .fill(Color("ColorGreenLight"))
                    .frame(width: 4)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(header.headline)
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    
                    Text(header.subheadline)
                        .font(.footnote)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.leading)
                        .foregroundColor( .white)
                        .shadow(radius: 3)
                        
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 20)
                .frame(width: 281, height: 105)
                .background(
                    Color("ColorBlackTransparentLight")
                )
                
            }//: HStack
            .frame(width: 285, height: 105, alignment: .center)
            .padding(30)
            .onAppear() {
                withAnimation(slideInAnimation) {
                    showHeadline = true
                }
            }
            .onDisappear() {
                withAnimation(slideInAnimation) {
                    showHeadline = false
                }
            }
            .offset(y: showHeadline ? 0 : 200 )
        }//: ZStask
        .frame(width: 480, height: 320, alignment: .center)
    }
}

#Preview {
    HeaderView(header: headerDatas[0])
}
