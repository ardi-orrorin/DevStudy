//
//  Frame.swift
//  SwiftUiStack
//
//  Created by 유승철 on 12/28/23.
//

import SwiftUI

struct FrameView: View {
    var body: some View {
        VStack{
            Text("`Hello world Test Frame ")
                .font(.largeTitle)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 100, maxWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,
                       minHeight: 100, maxHeight: 100,
                       alignment: .center)
            
            Text("Hello world Test Frame ")
                .font(.largeTitle)
                .frame(minWidth: 100, maxWidth: .infinity,
                       minHeight: 100, maxHeight: 100000,
                       alignment: .center)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 3)
        }
        .padding(20)
        .border(Color.black)
        // 안정영역 : 카메라 노치 다이나믹 아일랜드등 상단 알림 영역 위치
//        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)  //안정 영역 무시
        
    }
    
}

#Preview {
    FrameView()
}
