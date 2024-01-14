//
//  CardView.swift
//  CardComponentView
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNum: Int = 1
    @State private var randomNum: Int = 1
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                
                // MARK: header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        .customGrayLight,
                                        .customGrayMedium
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        Spacer()
                        Button(action: {
                            isShowingSheet.toggle()
                        }, label: {
                            CustomBtnView()
                                
                        })
                        .sheet(isPresented: $isShowingSheet){
                            SettingView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                        
                    }
                    
                    Text("Fun and enjoyable outdoor activ ity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal, 30)
                
                // MARK: Main Content
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNum)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNum)
                }
                
                // MARK: Footer
                
                Button(action: {
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium
                                    
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(
                            color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25),
                            radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                            x: 1, y: 2
                        )
                })
                .buttonStyle(GrradientBtn())
                
            
                
            }
        }.frame(width: 320, height: 570)
    }
    
    func randomImage() {
        repeat {
            randomNum = Int.random(in: 1...5)
        } while randomNum == imageNum                    
        imageNum = randomNum
    }
}

#Preview {
    CardView()
}
