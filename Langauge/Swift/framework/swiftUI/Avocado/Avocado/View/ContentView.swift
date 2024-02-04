//
//  ContentView.swift
//  Avocado
//
//  Created by 유승철 on 2/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                // MARK: - header
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        HeaderView()
                    }
                }
                
                
                // MARK: - footer
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                    Text("All about Avocados")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.bold)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(8)
                    
                    Text("Everything ypu wantyed to know about avocados but were too afraid to ask.")
                        .font(.system(.body, design: .serif))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                }//: VStack
                .frame(maxWidth: 640)
                .padding()
                .padding(.bottom, 85)
            }//: Vstack
        }//: ScrollView
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
