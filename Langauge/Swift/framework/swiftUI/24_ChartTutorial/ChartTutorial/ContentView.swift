//
//  ContentView.swift
//  ChartTutorial
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    var body: some View {
        
        let sales = [ 
            (channel: "Reatil", data: retailSales),
            (channel: "Online", data: onlineSales),
        ]
        
        Chart {
            ForEach(sales, id: \.channel) { channel in
                ForEach(channel.data) { sales in
                    AreaMark(
                        x: .value("Month", sales.month),
                        y: .value("Total", sales.total)
                    )
                    .foregroundStyle(by: .value("Channel", channel.channel))
                }
            }
        }
        .frame(height: 250)
        .padding()
        
    }
}

#Preview {
    ContentView()
}
