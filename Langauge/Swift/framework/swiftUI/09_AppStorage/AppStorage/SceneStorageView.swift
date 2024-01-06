//
//  SceneStorageView.swift
//  AppStorage
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct SceneStorageView: View {
    
//    @State private var editorText: String = "" // state 이용 방법
    @SceneStorage("myText") private var editorText: String = ""
    
    var body: some View {
        TextEditor(text: $editorText)
            .padding(30)
            .font(.title)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
    }
}

#Preview {
    SceneStorageView()
}
