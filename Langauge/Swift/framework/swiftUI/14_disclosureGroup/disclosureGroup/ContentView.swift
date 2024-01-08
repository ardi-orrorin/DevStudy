//
//  ContentView.swift
//  disclosureGroup
//
//  Created by 유승철 on 1/8/24.
//

import SwiftUI

struct CarInfo: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var children: [CarInfo]?
}

struct ContentView: View {
    
    let itemList = [
        CarInfo(name: "B1MW",
                description: "BMW is a German multinational company which currently produces luxury automobiles and motorcycles, and also produced aircraft engines until 1945.",
                children: [
                    CarInfo(name: "BMW 1 Series", description: "The BMW 1 Series is a range of subcompact executive cars manufactured by BMW since 2004. It is the successor to the BMW 3 Series Compact and is currently in its third generation."),
                    CarInfo(name: "BMW 2 Series", description: "The BMW 2 Series is a subcompact executive car produced by BMW. The 2 Series has several different body styles. It is available as a compact coupé that replaced the 1 Series coupé, or as a convertible model that replaces the 1 Series convertible in the BMW lineup."),
                    CarInfo(name: "BMW 3 Series", description: "The BMW 3 Series is a compact executive car manufactured by the German automaker BMW since May 1975. It is the successor to the 02 Series and has been produced in seven different generations."),
                    CarInfo(name: "BMW 4 Series", description: "The BMW 4 Series is a range of coupé, convertible and fastback models manufactured by the German automaker BMW since 2013. It was unveiled at the North American International Auto Show in January 2013 in Detroit."),
                    CarInfo(name: "BMW 5 Series", description: "The BMW 5 Series is an executive car manufactured by BMW since 1972. It is the successor to the New Class Sedans and is currently in its seventh generation."),
                    CarInfo(name: "BMW 6 Series", description: "The BMW 6 Series is a range of grand tourers produced by BMW since 1976. It is the successor to the E9 Coupé and is currently in its fourth generation."),
                    CarInfo(name: "BMW 7 Series", description: "The BMW 7 Series is a full-size luxury sedan produced by the German automaker BMW since 1977. It is the successor to the BMW E3 \"New Six\" sedan and is currently in its sixth generation."),
                    CarInfo(name: "BMW 8 Series", description: "The BMW 8 Series is a range of grand tourers produced by BMW. The 8 Series was introduced in 1990 under the E31 model code and was only available as a")
                ]
               )
    ]
                
                    
    
    var body: some View {
//        List(itemList, children: \.children) { item in
//            CellView(item: item)
//        }
//        .listStyle(.sidebar)
        List {
            ForEach(itemList) { item in
                Section(header: Text(item.name)) {
                    OutlineGroup(item.children ?? [CarInfo](), children: \.children) { children in
                        CellView(item: children)
                    }
                }
            }
        }.listStyle(InsetListStyle())
    }
}

#Preview {
    ContentView()
}
