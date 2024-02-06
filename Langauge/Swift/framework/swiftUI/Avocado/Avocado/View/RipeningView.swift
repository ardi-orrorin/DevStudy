//
//  RipeningView.swift
//  Avocado
//
//  Created by 유승철 on 2/6/24.
//

import SwiftUI

struct RipeningView: View {
    
    // MARK: - properties
    
    var ripening: Ripening
    
    @State private var slideInAnimation: Bool = false
    
    var body: some View {
        VStack {
            Image(ripening.image)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .zIndex(1)
                .background(
                    Circle()
                        .fill(Color("ColorGreenLight"))
                        .frame(width: 110, height: 110, alignment: .center)
                )
                .background(
                    Circle()
                        .fill(Color("ColorAppearenceAdaptive"))
                        .frame(width: 120, height: 120, alignment: .center)
                )
                .offset(y: slideInAnimation ? 55 : -55)
            
            VStack(alignment: .center, spacing: 10) {
                // stage
                VStack(alignment: .center, spacing: 0) {
                    Text(ripening.stage)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                    Text("STAGE")
                        .font(.system(.body, design: .serif))
                        .fontWeight(.heavy)
                } //: vstack
                .foregroundColor(Color("ColorGreenMedium"))
                .padding(.top, 65)
                .frame(width: 180)
                
                // title
                Text(ripening.title)
                    .font(.system(.title, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(Color("ColorGreenMedium"))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 0)
                    .frame(width: 220)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [
                                            .white,
                                            Color("ColorGreenLight"),
                                        ]
                                    ),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )//: linerGradient
                            ) //: fill
                            .shadow(
                                color: Color("ColorBlackTransparentLight"),
                                radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/,
                                x: 0, y: 6
                            )
                    )//: background
                    
                
                // description
                Spacer()
                Text(ripening.description)
                    .foregroundColor(Color("ColorGreenDark"))
                    .fontWeight(.bold)
                    .lineLimit(nil)
                Spacer()
                
                // ripeness
                Text(ripening.ripeness)
                    .foregroundColor(Color.white)
                    .font(.system(.callout, design: .serif))
                    .fontWeight(.bold)
                    .shadow(radius: 3)
                    .padding(.vertical)
                    .padding(.horizontal, 0)
                    .frame(width: 185)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(
                                        colors: [
                                            Color("ColorGreenMedium"),
                                            Color("ColorGreenDark")
                                        ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                ) //: linearGradient
                            ) //: fill
                            .shadow(
                                color: Color("ColorBlackTransparentLight"),
                                radius: 6, x: 0, y: 6
                            )
                    )
                // instruction
                Text(ripening.instruction)
                    .font(.footnote)
                    .foregroundColor(Color("ColorGreenLight"))
                    .fontWeight(.bold)
                    .lineLimit(3)
                    .frame(width: 160)
                
                Spacer()
                
            }//: vstack
            .zIndex(0)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
            .frame(width: 260, height: 485, alignment: .center)
            .background(
                LinearGradient(
                    gradient: Gradient(
                        colors: [
                            Color("ColorGreenLight"),
                            Color("ColorGreenMedium")
                        ]
                    ),
                    startPoint: .top,
                    endPoint: .bottom
                ) //: LinearGradient
            ) //: baclground
            .cornerRadius(20)

        } //: vstack
        .edgesIgnoringSafeArea(.all)
        .onAppear() {
            withAnimation(.easeInOut(duration: 1)) {
                slideInAnimation.toggle()
            }
        }
    }
}

#Preview {
    RipeningView(ripening: ripeningData[2])
}
