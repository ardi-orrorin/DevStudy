//
//  ContentView.swift
//  ChartView
//
//  Created by 유승철 on 1/13/24.
//

// 차트의 종류 import Charts
/*
    area(영역), bar(막대), point(점), rectangle(직사각형), line(선), stacked bar(누적막대)
    AreaMark, BarMark, PointMark, RectangleMark, LineMark, RuleMark
 */

import SwiftUI
import Charts

struct ContentView: View {
    
    let tempData: [MonthlyTemp] = [
        .init(month: "Jan", degrees: 50),
        .init(month: "Feb", degrees: 43),
        .init(month: "Mar", degrees: 61),
        .init(month: "Apr", degrees: 64),
        .init(month: "May", degrees: 75),
        .init(month: "Jun", degrees: 83),
        .init(month: "Jul", degrees: 87),
        .init(month: "Aug", degrees: 84),
        .init(month: "Sep", degrees: 77),
        .init(month: "Oct", degrees: 68),
        .init(month: "Nov", degrees: 57),
        .init(month: "Dec", degrees: 48)
    ]
    
    var body: some View {
        VStack {
            Chart {
                
                ForEach(tempData) { data in
//                    AreaMark(
//                        x: .value("Month", data.month),
//                        y: .value("Temp", data.degrees)
//                    )
                    RectangleMark(
                        x: .value("Month", data.month),
                        y: .value("Temp", data.degrees)
                    )
                    LineMark(
                        x: .value("Month", data.month),
                        y: .value("Temp", data.degrees)
                    )
                    
                    
                }
//                AreaMark(
//                    x: .value("Month", "Jan"),
//                    y: .value("Temp", 50)
//                )
//                
//                AreaMark(
//                    x: .value("Month", "Feb"),
//                    y: .value("Temp", 43)
//                )
//                
//                AreaMark(
//                    x: .value("Month", "Mar"),
//                    y: .value("Temp", 61)
//                )
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
