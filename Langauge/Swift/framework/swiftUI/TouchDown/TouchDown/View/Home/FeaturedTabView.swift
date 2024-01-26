//
//  FeaturedTabView.swift
//  TouchDown
//
//  Created by 유승철 on 1/26/24.
//

import SwiftUI

struct FeaturedTabView: View {
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(player: player)
//                    .padding(.top, 10)
//                    .padding(.horizontal, 15)
            }//: loop
        }//: tabVeiw
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
    }
}

#Preview {
    FeaturedTabView()
        .background(.gray)
}
