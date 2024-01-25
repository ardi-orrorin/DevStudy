//
//  AnimalGridItemView.swift
//  safari
//
//  Created by 유승철 on 1/25/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    AnimalGridItemView(animal: animals[0])
}
