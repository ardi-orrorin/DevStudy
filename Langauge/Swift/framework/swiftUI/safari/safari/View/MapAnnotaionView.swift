//
//  MapAnnotaionView.swift
//  safari
//
//  Created by 유승철 on 1/23/24.
//

import SwiftUI

struct MapAnnotaionView: View {
    
    var location: NationalParkLocation
    
    @State private var animation: Double = 0.0
    
    
    var body: some View {
        ZStack {
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
            .clipShape(Circle())
        }//: ZSTACK
        .onAppear(perform: {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        })
    }
}


let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

#Preview {
    MapAnnotaionView(location: locations[0])
}
