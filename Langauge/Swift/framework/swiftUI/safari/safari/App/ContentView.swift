//
//  ContentView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // MARK: PROPERTIES
        let animals: [Animal] = Bundle.main.decode("animals.json")
        
        // MARK: BODY
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                            AnimalListItemView(animal: animal)
                        }
                }//:forEach
            }//: LIST
            .navigationBarTitle("Africa", displayMode: .large)
        } // Navigation
    }//:body
}//view


// MARK: Preview
#Preview {
    ContentView()
}
