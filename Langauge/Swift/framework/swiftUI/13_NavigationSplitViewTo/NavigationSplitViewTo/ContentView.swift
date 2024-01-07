//
//  ContentView.swift
//  NavigationSplitViewTo
//
//  Created by 유승철 on 1/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var categories = [
        IconCategory(categoryName: "Folders",
                     images: ["questionmark.folder.ar",
                              "questionmark.folder",
                              "questionmark.folder.fill.ar",
                              "folder.fill.badge.gear",
                              "questionmark.folder.fill"
                             ]),
        IconCategory(categoryName: "Circles",
                     images: ["book.circle",
                              "books.vertical.circle",
                              "books.vertical.circle.fill",
                              "book.circle.fill",
                              "book.closed.circle",
                             ]),
        IconCategory(categoryName: "Clouds",
                     images: ["cloud.rain",
                              "cloud",
                              "cloud.drizzle.fill",
                              "cloud.fill",
                              "cloud.drizzle"
                             ])
    ]
    
    @State private var selectedCategory: IconCategory?
    @State private var selectedImage: String?
    @State private var columnVisibility = NavigationSplitViewVisibility.all
    
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List(categories, selection: $selectedCategory) { cate in
                Text(cate.categoryName).tag(cate)
            }
        } content: {
            if let selectedCategory {
                List(selectedCategory.images,
                     id: \.self,
                     selection: $selectedImage) { image in
                    HStack {
                        Image(systemName: image)
                        Text(image)
                    }.tag(image)
                }
            } else {
                Text("Select a category")
            }
        } detail: {
            if let selectedImage {
                Image(systemName: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            
            } else {
                Text("Select an image")
            }
        }
        .navigationSplitViewStyle(.prominentDetail)
    }
}

#Preview {
    ContentView()
}
