//
//  ContentView.swift
//  AppStorage
//
//  Created by 유승철 on 1/6/24.
//
// @SceneStorage : 앱 화면 인스턴스의 범위 내에서 소량의 데이터를 저장하는 데 사용
// @AppStorage : 앱 전체에서 접근하고 사용할 수 있는 데이터를 저장하는 데 사용


import SwiftUI

struct ContentView: View {
    
    @SceneStorage("city") var city : String = "" // city 키 이름을 사용한 String 값
    
    @AppStorage("mystore", store: UserDefaults(
    suiteName: "group.com.ebookfrenzy.userdefaults"))
    var mystore: String = ""
    
    
    var body: some View {
//        VStack {
//            TextEditor(text: $city)
//                .frame(height: 30)
//                .border(Color.gray)
//                .padding()
//            TextEditor(text: $mystore)
//                .frame(height: 30)
//                .border(Color.gray)
//                .padding()
//        }
//        .padding()
        
        TabView {
            SceneStorageView()
                .tabItem {
                    Image(systemName: "circle.fill")
                    Text("SceneStorage")
                }
            AppStorageView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("AppStorage")
                }
        }
    }
}

#Preview {
    ContentView()
}
