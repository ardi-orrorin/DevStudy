//
//  FeaturedItemView.swift
//  TouchDown
//
//  Created by 유승철 on 1/26/24.
//

import SwiftUI

struct FeaturedItemView: View {
    
    // MARK: - property
    let player: Player
    
    // MARK: - body
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}


// MARK: - preview
#Preview {
    FeaturedItemView(player: players[0])
}
