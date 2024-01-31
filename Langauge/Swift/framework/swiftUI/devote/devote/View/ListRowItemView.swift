//
//  ListRowItemView.swift
//  devote
//
//  Created by 유승철 on 1/31/24.
//

import SwiftUI

struct ListRowItemView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @ObservedObject var item: Item
    
    
    var body: some View {
        withAnimation(.default) {
            Toggle(isOn: $item.completion) {
                Text(item.task ?? "")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(item.completion ? .pink : .primary)
                    .padding(.vertical, 12)
            }//: Toggle
            .toggleStyle(CheckboxStyle())
            .onReceive(item.objectWillChange, perform: { _ in
                if self.viewContext.hasChanges {
                    try? self.viewContext.save()
                    
                }
            })
        }//: withAnimaiton
        
    }
}
