//
//  ContentView.swift
//  CustomCalendar
//
//  Created by 유승철 on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CalendarView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
            
            CustomCalendarView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
        }
        .tabViewStyle(.page)
        .padding()
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}
