//
//  ExternalWeblinkView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    let animal: Animal
    
    var body: some View {
            GroupBox {
                Link(destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!){
                    HStack {
                        Image(systemName: "globe")
                        Text("Wikipedia")
                        Spacer()
                        
                        Group {
                            Image(systemName: "arrow.up.right.square")
                            
                            Text(animal.name)
                        }
                        .foregroundColor(.accentColor)
                    }
                } //: HSTACK
            } //: BOX
    }
}

#Preview {
    ExternalWeblinkView(animal: animals[0])
}
