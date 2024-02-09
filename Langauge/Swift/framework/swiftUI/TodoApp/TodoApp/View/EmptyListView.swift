//
//  EmptyListView.swift
//  TodoApp
//
//  Created by 유승철 on 2/9/24.
//

import SwiftUI

struct EmptyListView: View {
    
    @State private var isAnimated: Bool = false
    
    let images: [String] = [
        "illustration-no1",
        "illustration-no2",
        "illustration-no3"
    ]
    
    let tips: [String] = [
        "Use your time wisely",
        "Slow and steady wins",
        "Keep it short and sweet",
        "Put hard tasks first",
        "Reward yourself after work",
        "Collect tasks ahead of time",
        "Each night schedule for tomorrow"
    ]
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Image((images.randomElement() ?? images[0]))
                    .resizable()
                    .scaledToFit()
                    .frame(
                        minWidth: 256,  idealWidth: 280,  maxWidth: 360,
                        minHeight: 256, idealHeight: 280, maxHeight: 360,
                        alignment: .center
                    )
                    .layoutPriority(1)
                
                Text(tips.randomElement() ?? tips[0])
                    .layoutPriority(0.5)
                    .font(.system(.headline, design: .rounded))
            } //: vstack
            .padding(.horizontal)
            .opacity(isAnimated ? 1 : 0)
            .offset(y: isAnimated ? 0 : -50)
            .onAppear() {
                withAnimation(.easeInOut(duration: 1)) {
                    isAnimated.toggle()
                }
            }
        } //: zstack
        .frame(
            minWidth:  0, maxWidth:  .infinity,
            minHeight: 0, maxHeight: .infinity
        )
        .background(Color("ColorBase"))
        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    EmptyListView()
}
