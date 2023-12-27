//
//  MyVStack.swift
//  tutorial
//
//  Created by 유승철 on 12/27/23.
//

import SwiftUI

struct MyVStack<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping () -> Content){
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 10) {
            content()
        }
        .font(.largeTitle)
    }
}
