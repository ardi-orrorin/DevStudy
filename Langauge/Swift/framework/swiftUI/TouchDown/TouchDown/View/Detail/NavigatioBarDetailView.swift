//
//  avigatioBarDetailView.swift
//  TouchDown
//
//  Created by 유승철 on 1/28/24.
//

import SwiftUI

struct NavigatioBarDetailView: View {
    @EnvironmentObject var shop: Shop
    
    var body: some View {
        HStack {
            Button {
                withAnimation(.easeOut) {
                    shop.selectProduct = nil
                    shop.showingProduct = false
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            
            Button {
                
            } label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }

    }
}

#Preview {
    NavigatioBarDetailView()
        .background(Color.gray)
        .environmentObject(Shop())
}
