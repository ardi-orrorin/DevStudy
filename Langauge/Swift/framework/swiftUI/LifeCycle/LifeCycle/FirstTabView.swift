//
//  FirstTabView.swift
//  LifeCycle
//
//  Created by 유승철 on 1/3/24.
//

import SwiftUI

struct FirstTabView: View {
    
    @State var title = "View One"
    
    var body: some View {
        Text(title)
            .onAppear(perform: { // View가 나타날 때 실행
                print("View One Appeared!")
            })
            .onDisappear(perform: { // View에서 사라질 때
                print("View One Disappeared!")
            })
            .task(priority: .background, {
                title = await changeTitle()
            })
    }
    
    func changeTitle() async -> String {
        sleep(5)
        return "Async task complete"
    }
}

#Preview {
    FirstTabView()
}
