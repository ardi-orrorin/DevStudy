//
//  SourceLinkView.swift
//  Fructus
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        
        Link(destination: URL(string: "https://wikipedia.com")!) {
            GroupBox() {
                HStack {
                    Text("Content source")
                    Spacer()
                    Text("Wikipedia")
                    Image(systemName: "arrow.up.right.square")
                }
                .font(.footnote)
            }
        }
        
    }
}

#Preview {
    SourceLinkView()
        .padding()
}
