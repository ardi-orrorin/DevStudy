//
//  SettingView.swift
//  disclosureGroup
//
//  Created by 유승철 on 1/8/24.
//

import SwiftUI

struct SettingView: View {
    
    
    @State private var hybridState: Bool = false
    @State private var electricState: Bool = true
    @State private var fuelCellState: Bool = false
    @State private var inversionState: Bool = true
    @State private var filterExpanded: Bool = true
    
    var body: some View {
        Form {
            DisclosureGroup(isExpanded: $filterExpanded) {
                ToggleControl(title: "Hybrid Cars", state: hybridState)
                ToggleControl(title: "Electric Cars", state: electricState)
                ToggleControl(title: "Fuel Cell Cars", state: fuelCellState)
            } label: {
                Label("Categoris Filters", systemImage: "car.2.fill")
            }
            
            DisclosureGroup {
                ColorControl(color: .red, label: "Background Color")
                ColorControl(color: .blue, label: "Foreground Color")
                ToggleControl(title: "Inversion", state: inversionState)
            } label: {
                Label("Color Settings", systemImage: "scribble.variable")
            }
        }
    }
}


struct ColorControl: View {
    var color: Color
    var label: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Rectangle()
                .fill(color)
                .frame(width: 30, height: 30)
        }
        .padding(.leading)
        .scaledToFill()
    }
}


struct ToggleControl: View {
    var title: String
    @State var state: Bool
    var body: some View {
        Toggle(title, isOn: $state)
            .padding(.leading)
    }
}


#Preview {
    SettingView()
}
