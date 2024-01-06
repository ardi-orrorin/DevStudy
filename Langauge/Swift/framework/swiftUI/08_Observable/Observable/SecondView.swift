//
//  ScondView.swift
//  Observable
//
//  Created by 유승철 on 1/6/24.
//

import SwiftUI

struct SecondView: View {
    
    @EnvironmentObject var timerData: TimerData
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
            Text("Timer Count = \(timerData.timeCount)")
                .font(.headline)
        }
        .padding()
    }
}

#Preview {
    SecondView().environmentObject(TimerData())
}
