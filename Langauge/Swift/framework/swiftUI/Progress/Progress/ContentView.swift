//
//  ContentView.swift
//  Progress
//
//  Created by 유승철 on 1/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: Double = 1.0
    
    
    var body: some View {
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
//                .progressViewStyle(LinearProgressViewStyle(tint: .red)) // 선형 그래프프
//                .progressViewStyle(CircularProgressViewStyle())
                .progressViewStyle(MyCustomProgressViewSytle())
            
            Slider(value: $progress, in: 1...100, step: 0.1)

        }
        .padding()
        
        
        VStack {
            ProgressView("Task Progress", value: progress, total: 100)
            ProgressView("Task Progress", value: progress, total: 100)
            ProgressView("Task Progress", value: progress, total: 100)
        }
        .progressViewStyle(CircularProgressViewStyle())
    }
}

// 사용자 정의 ProgressView
struct MyCustomProgressViewSytle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
//        ProgressView(configuration)
//            .accentColor(.red)
//            .shadow(color: .blue, radius: 5.0)
//            .progressViewStyle(LinearProgressViewStyle())
        let percent = Int(configuration.fractionCompleted! * 100)
        return Text("Task \(percent)% Compledte")
    }
    
    
}

#Preview {
    ContentView()
}
