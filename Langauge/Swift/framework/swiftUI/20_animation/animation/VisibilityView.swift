//
//  VisibilityView.swift
//  animation
//
//  Created by 유승철 on 1/12/24.
//

import SwiftUI

struct VisibilityView: View {
    
    
    @State private var visibility = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $visibility.animation(.linear(duration: 5))) {
                Text("Toggle Text Views")
            }
        }
        .padding()
        
        if visibility {
            Text("Hello World!")
                .font(.largeTitle)
        }
        
        if !visibility {
            Text("Goodbye World!")
                .font(.largeTitle)
        }
    }
}

#Preview {
    VisibilityView()
}
