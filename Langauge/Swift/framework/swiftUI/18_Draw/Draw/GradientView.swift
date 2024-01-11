//
//  GradientView.swift
//  Draw
//
//  Created by 유승철 on 1/11/24.
//

import SwiftUI

struct GradientView: View {
    
    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
    
    var body: some View {
//        Circle()
//            .fill(.blue.gradient)
//            .frame(width: 200, height: 200)
//        
//        Circle()
//            .fill(.blue.shadow(.drop(color: .red, radius: 10)))
//            .frame(width: 150, height: 150)
//        
//        Circle()
//            .fill(.blue.shadow(.inner(color: .red, radius: 10)))
//            .frame(width: 150, height: 150)
//        
//        Circle()
//            .fill(RadialGradient(gradient: colors,
//                                 center: .center,
//                                 startRadius: 0,
//                                 endRadius: 300))
//        Circle()
//            .fill(AngularGradient(gradient: colors,
//                                 center: .center))
        
//        Rectangle()
//            .fill(LinearGradient(gradient: colors,
//                                 startPoint: .topLeading,
//                                 endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
        MyShape()
            .fill(RadialGradient(gradient: colors,
                                 center: .center,
                                 startRadius: 0,
                                 endRadius: 300))
            .background(LinearGradient(gradient: colors, startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 360, height: 350)
    }
}

#Preview {
    GradientView()
}
