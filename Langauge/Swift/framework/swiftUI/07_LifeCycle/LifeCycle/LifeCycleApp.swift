//
//  LifeCycleApp.swift
//  LifeCycle
//
//  Created by 유승철 on 1/3/24.
//
import SwiftUI

@main
struct LifeCycleApp: App {
    // scencePhase 현재 화면의 상태를 저장하기 위한 SwiftUI의 Environment 속성이다.
    @Environment(\.scenePhase) private var scencePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scencePhase, { _ , newValue in
            switch newValue {
                case .active: print("Active") // 화면 활성화 상태 인터액션에 반응가능한 상태
                case .inactive: print("inActive") // 화면은 활성화 상태이나 인터액션에 반응이 불가능 한 상태 예를들어 작업표시화면, 및 스테이지 매니저에 여러 창을 띄워놓을 때
                case .background: print("background") // 최소화 되어 백그라운드인 상태, 화면도 비활성, 인터액션도 비활성
                default : print("Unknwon scenephase")
            }
        })
    }
}
