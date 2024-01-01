//
//  EnvironmentView.swift
//  State
//
//  Created by 유승철 on 12/29/23.
//

import SwiftUI

struct EnvironmentView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Slider(value: $speedSetting.speed, in: 0...100)
    }
}

struct DisplayView: View {
    @EnvironmentObject var speedSetting: SpeedSetting
    
    var body: some View {
        Text("\(speedSetting.speed)")
    }
}

struct EnvContentView: View {
    let speedSetting = SpeedSetting()
    
    var body: some View {
        VStack {
            EnvironmentView()
            DisplayView()
        }.environmentObject(speedSetting)
    }
}


#Preview {
    EnvContentView()
}
