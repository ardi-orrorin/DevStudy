//
//  InsetFactView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct InsetFactView: View {
    
    // MARK: PROPERTIES
    let animal: Animal
    
    // MARK: BODY
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//: TAB
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//: BOX
    }
}

#Preview {
    InsetFactView(animal: animals[0])
}
