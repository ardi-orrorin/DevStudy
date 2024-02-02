//
//  ContentView.swift
//  LearnByDoing
//
//  Created by 유승철 on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - properties
    
    var cards: [Card] = cardData
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 20) {
                ForEach(cards) { card in
                    CardView(card: card)
                }
            }
            .padding(30)
        }
        
    
    }
}

#Preview {
    ContentView()
}
