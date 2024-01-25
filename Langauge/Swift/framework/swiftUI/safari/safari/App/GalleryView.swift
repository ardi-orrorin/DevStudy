//
//  GalleryView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct GalleryView: View {
    
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
//    let hapticss = UIImpactFeedbackGenerator(style: .medium)
    
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumnn: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumnn))
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 30) {
                // MARK: IMAGE
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 8)
                    )
        
                // MARK: SLIDER
                Slider(value: $gridColumnn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumnn) {
                        withAnimation(.easeIn){
                            gridSwitch()
                        }
//                        hapticss.impactOccurred()
                    }
                
                
                // MARK: GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
//                                hapticss.impactOccurred()
                            }
                    }//: LOOP
                }//: GRID
                .onAppear(perform: {
                    gridSwitch()
                })
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationVeiw())
    }
}

#Preview {
    GalleryView()
}
