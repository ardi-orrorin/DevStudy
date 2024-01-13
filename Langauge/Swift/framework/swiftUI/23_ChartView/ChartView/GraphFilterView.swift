//
//  GraphFilterView.swift
//  ChartView
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI
import Charts

struct GraphFilterView: View {
    
    let tempData: [GraphFilterModel] = [
    
        .init(month: "Jan", degrees: 50, year: "2020"),
        .init(month: "Feb", degrees: 43, year: "2020"),
        .init(month: "Mar", degrees: 61, year: "2020"),
        .init(month: "Apr", degrees: 64, year: "2020"),
        
        .init(month: "Jan", degrees: 30, year: "2021"),
        .init(month: "Feb", degrees: 50, year: "2021"),
        .init(month: "Mar", degrees: 63, year: "2021"),
        .init(month: "Apr", degrees: 20, year: "2021"),
        
        .init(month: "Jan", degrees: 4, year: "2022"),
        .init(month: "Feb", degrees: 30, year: "2022"),
        .init(month: "Mar", degrees: 12, year: "2022"),
        .init(month: "Apr", degrees: 80, year: "2022"),
    ]
    
    
    var body: some View {
        VStack {
            Chart {
                ForEach(tempData) { data in
                    LineMark(x: .value("Month", data.month),
                             y: .value("Temp", data.degrees)
                    )
                    .interpolationMethod(.catmullRom) // 보간법 : 데이터 포인트를 연결하기 위한 선을 그리는 방법
                    .foregroundStyle(by: .value("Year", data.year))
                    .symbol(by: .value("Year", data.year))
                }
                
            }
            .padding()
            .chartPlotStyle { area in // 차트 배경 적용
                area.background(.gray.opacity(0.1))
            }
        }.padding()
    }
}


struct GraphFilterModel: Identifiable {
    var id = UUID()
    var month: String
    var degrees: Int
    var year: String
}


#Preview {
    GraphFilterView()
}
