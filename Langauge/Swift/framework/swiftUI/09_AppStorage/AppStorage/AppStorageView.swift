//
//  AppStorageView.swift
//  AppStorage
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct AppStorageView: View {
    
    @AppStorage("myText") var editorText: String = "Simple Text"
    
    @SceneStorage("myText") var scenceText: String = ""
    
    var body: some View {
        VStack {
            Text("SceneStorage : \(scenceText)")
            TextEditor(text: $editorText)
                .padding(30)
                .font(.title)
                .border(Color.black)
        }
        .padding()
        
    }
}

#Preview {
    AppStorageView()
}

