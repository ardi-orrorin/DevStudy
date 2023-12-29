//
//  DynamicLayout.swift
//  SwiftUiStack
//
//  Created by 유승철 on 12/28/23.
//

import SwiftUI

struct DynamicLayout: View {
    
    @State var myLayout: AnyLayout = AnyLayout(VStackLayout())
    
    var body: some View {
        
        VStack {
            myLayout {
                Image(systemName: "goforward.10")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(systemName: "goforward.15")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image(systemName: "goforward.60")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .padding(30)
        
        HStack {
            Button(action: {
                myLayout = AnyLayout(HStackLayout())
            }) {
                Text("HStack")
            }
            .padding(30)
            
            Button(action: {
                myLayout = AnyLayout(VStackLayout())
            }) {
                Text("VStack")
            }
            .padding(30)
        }
        .padding(30)
    }
}

#Preview {
    DynamicLayout()
}
