//
//  CustomCalendarView.swift
//  CustomCalendar
//
//  Created by 유승철 on 2/11/24.
//

import SwiftUI

struct CustomCalendarView: View {
    
    @State var date:Date = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
    
    var body: some View {
        VStack(spacing: 10) {
            HeaderView(date: date)
                .padding()
            
            CalendarDayView()
                .padding()
            
            Spacer()
        }
    }
}

struct HeaderView: View {
    
    @State var date: Date
    @State var showMonthPicker = false
    @Environment(\.presentationMode) var presentationMode
    
    func getMonth () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        return formatter.string(from: date)
    }
    
    func getYear () -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                VStack {
                    HStack {
                        Button {
                            showMonthPicker.toggle()
                        } label: {
                            Text("\(getYear())")
                                .font(.title)
                                .foregroundColor(.gray)
                                .bold()
                                .frame(width: 100)
                        }
                        .sheet(isPresented: $showMonthPicker){
                            Picker(selection: $date, label: Text("")){
                                ForEach(1..<13) { month in
                                    Text("\(month)월")
                                        .tag(month)
                                }
                            }
                            .labelsHidden()
                            .datePickerStyle(.wheel)
                            
                            Button {
                                showMonthPicker.toggle()
                            } label: {
                                Text("확인")
                            }
                        }
                        Spacer()
                    }
                }
                
                
                HStack {
                    Spacer()
                    Text("\(getMonth())")
                        .font(.title)
                        .foregroundColor(.gray)
                        .bold()
                        .frame(width: 100)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }
            }
        }
    }
}

struct CalendarDayView: View {
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 3) {
                ForEach(0..<31) { item in
                    DayItemView(day: item)
                }
            }
            
            Spacer()
        }
        
    }
}


struct DayItemView: View {
    var day: Int
    @State var clicked: Bool = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: 50, height: 50)
            .overlay(
                Text("\(day)")
                    .foregroundColor(.black)
            )
            .foregroundColor(clicked ? .red : .gray)
            .onTapGesture {
                clicked.toggle()
            }
    }
}


#Preview {
    CustomCalendarView()
}
