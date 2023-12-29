//
//  ContentView.swift
//  State
//
//  Created by 유승철 on 12/29/23.
//

import SwiftUI

struct ContentView: View {
    
    // @State 상태 프로퍼티
    // String Int 같은 간닪나 데이터타입을 저장하기 위해 사용된다.
    @State private var wifiEnabled: Bool = false
    @State private var userName: String = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-Fi")
            }
            TextField("Enter user name", text: $userName)
            Text(userName)
            WifiImageView(wifiEnabled: $wifiEnabled)
        }
        .padding()
    }
}

// binding
// @State 프로퍼티를 다른 뷰에 전달할 때 사용한다.

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi" : "wifi.slash")
    }
}

#Preview {
    ContentView()
}
