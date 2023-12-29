//
//  Align.swift
//  SwiftUiStack
//
//  Created by 유승철 on 12/28/23.
//

import SwiftUI

struct AlignView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Financial Results")
                .font(.title)
            
            HStack(alignment: .top) {
                Text("Q1 Sales")
                    .font(.headline)
                    .padding(20)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                Spacer() // 뷰들의 간격을 유연하게 확장 또는 축소한다.
                
                VStack(alignment: .leading) {
                    Text("January")
                    Text("February")
                    Text("March")
                }
                .padding(20)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("$1000")
                    Text("$200")
                    Text("$3000")
                }
                .padding(20)
                .border(Color.black)
            }
        }
        .padding(20)  
    }
}

#Preview {
    AlignView()
}
