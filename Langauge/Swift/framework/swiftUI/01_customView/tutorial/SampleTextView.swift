//
//  SampleTextView.swift
//  tutorial
//
//  Created by 유승철 on 12/27/23.
//

import SwiftUI

struct SampleTextView: View {
    var body: some View {
        Text("Sample Text")
            .font(.custom("Copperplate", size: 70))
            .padding()
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        Text("Sample Text2")
            .modifier(StandardTitle())
            .padding()
        Text("Sampele Text2")
            .modifier(StandardTitle())
            .padding()
        
    }
}

#Preview {
    SampleTextView()
}
