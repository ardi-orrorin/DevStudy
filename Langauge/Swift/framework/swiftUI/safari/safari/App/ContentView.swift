//
//  ContentView.swift
//  safari
//
//  Created by 유승철 on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible()) ]
    @State private var gridColumn: Int = 1
    @State private var toolbarIconn: String = "square.grid.2x2"

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        switch gridColumn {
        case 1:
            toolbarIconn = "square.grid.2x2"
        case 2:
            toolbarIconn = "square.grid.3x2"
        case 3:
            toolbarIconn = "rectangle.grid.1x2"
        default:
            toolbarIconn = "square.grid.2x2"
        }
    }
    
    var body: some View {
        
        
        // MARK: BODY
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalListItemView(animal: animal)
                                }// Link
                        }//:forEach
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalGridItemView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }// : FOREACH
                        }// : GRID
                        .padding(10)
                    } // SCROLL
                }//: CONDITION
            } //: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 16) {
                        //LIST
                        Button {
                            withAnimation(.easeIn) {
                                print("List view is activated")
                                isGridViewActive = false
                                haptics.impactOccurred()
                            }
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        //GRID
                        Button {
                            withAnimation(.easeIn) {
                                print("Grid view is activated")
                                isGridViewActive = true
                                haptics.impactOccurred()
                                gridSwitch()
                            }
                        } label: {
                            Image(systemName: toolbarIconn)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }//: HSTACK
                }//: TOOLBAR ITEM
            } //: TOOLBAR
        } // Navigation
    }//:body
}//view


// MARK: Preview
#Preview {
    ContentView()
}
