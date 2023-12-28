//
//  GeometryReaderView.swift
//  SwiftUiStack
//
//  Created by 유승철 on 12/28/23.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { geomery in
            VStack {
                Text(geomery.size.width.description)
                Text(geomery.size.height.description)
                Text("Hello World, how are you?")
                    .font(.largeTitle)
                    .frame(width: geomery.size.width / 2,
                           height: (geomery.size.height / 5) * 3)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                Text("GoodBye World")
                    .font(.largeTitle)
                    .frame(width: geomery.size.width / 3,
                           height: geomery.size.height / 5)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GeometryReaderView()
}
