//
//  ContentView.swift
//  Stack
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        // .trailing : 오른쪽 정렬
        // .leading : 왼쪽 정렬
        // .center : 가운데 정렬
        
        // .firstTextBaseline : 텍스트의 첫번째 줄을 기준으로 정렬
        // .lastTextBaseline : 텍스트의 마지막 줄을 기준으로 정렬
        VStack(alignment: .center){
            Text("This some text")
            Text("This some longer text")
            Text("This is short")
            
            HStack(alignment: .center, spacing: 20) {
                Text("This some text")
                    .font(.largeTitle)
                Text("This some longer text")
                    .font(.title)
                Text("This is short")
                    .font(.headline)
            }
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        
        
        // .alignmentGuide : 정렬 가이드를 설정
        // stack alignment와 같아야 한다.
        
        
        VStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.green)
                .frame(width: 120, height: 50)
            Rectangle()
                .foregroundColor(.red)
                .alignmentGuide(.leading, computeValue: { d in d.width / 2 })
                .frame(width: 200, height: 50)
            Rectangle()
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .alignmentGuide(.leading, computeValue: { d in
                    d[HorizontalAlignment.trailing] + 30
                })
                .frame(width: 180, height: 50)
            
        }
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
