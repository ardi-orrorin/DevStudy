//
//  CustomCalendarView.swift
//  CustomCalendar
//
//  Created by 유승철 on 2/11/24.
//

import SwiftUI
import TipKit

struct CustomCalendarView: View {
    
    @State var date:Date = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
    
    @State var memo: String = ""
    
    @State var modalOffset: CGPoint = .zero
    @State var modalToggle: Bool = false
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                VStack(spacing: 40) {
                    HeaderView(date: date)
                    
                    CalendarDayView(modalToggle: $modalToggle, modalOffset: $modalOffset)
                }
                .padding()
                
                Spacer()
                
                FooterBtn(date: date, memo: memo)
            }
            
            
            if modalToggle {
                VStack(alignment: .leading) {
                    Text("ModalText")
                }
                .frame(width: 200, height: 200)
                .padding()
                .background(Color("AccentColor"))
                .cornerRadius(10)
                .shadow(radius: 5, x: 0, y: 5)
                .offset(x: modalOffset.x, y: modalOffset.y)
            }
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
                        showMonthPicker.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                    .sheet(isPresented: $showMonthPicker) {
                        VStack {
                            DatePicker("Please enter a date", selection: $date, displayedComponents: .date)
                            .labelsHidden()
                            .datePickerStyle(.wheel)
                            
                            MemoItemView()
                                .padding()
                            
                            Button {
                                showMonthPicker.toggle()
                            } label: {
                                Text("Save")
                                    .frame(minWidth: 200)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                    
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct CalendarDayView: View {
    
    
    @Binding var modalToggle: Bool
    
    @Binding var modalOffset: CGPoint
    
    
    var body: some View {
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7), spacing: 3) {
                ForEach(1..<32) { item in
                    DayItemView(day: item, modalToggle: $modalToggle, modalOffset: $modalOffset)
                        
                }
            }
            
        }
        
    }
}


struct DayItemView: View {
    var day: Int
    @State var clicked: Bool = false
    
    @Binding var modalToggle: Bool
    
    @Binding var modalOffset: CGPoint
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 50, height: 50)
                .overlay(
                    Text("\(day)")
                        .foregroundColor(clicked ? .white : .black)
                )
                .foregroundColor(clicked ? .blue : Color("AccentColor"))
                .onTapGesture(coordinateSpace: .local) { point in
                    
                    modalOffset = point
                    
                    print("point: \(point)")
                    
                    withAnimation(.easeIn(duration: 0.3)) {
                        clicked.toggle()
                        modalToggle.toggle()
                    }
                }
        }
    }
}

struct MemoItemView: View {
    @State var memo = ""
    
    var body: some View {
        ZStack {
            TextEditor(text: $memo)
                .font(.footnote)
                .padding(9)
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1)
                )
                
            
            if memo.count == 0 {
                HStack {
                    VStack {
                        Text("Enter to memo...")
                            .foregroundColor(.gray)
                            .font(.footnote)
                        Spacer()
                    }
                    .padding(.vertical)
                    Spacer()
                }
                .padding(.horizontal)
            }
        }
        .frame(maxHeight: 150)
    }
}

struct FooterBtn: View {
    var date: Date
    var memo: String
    
    var body: some View {
        HStack {
            Button {
                print("date: \(date), memo: \(memo)")
            } label :{
                Text("Save")
                    .foregroundStyle(.gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            
            Button {
                
            } label :{
                Text("Cancel")
                    .foregroundStyle(.gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .frame(maxHeight: 30)
    }
}



#Preview {
    CustomCalendarView()
}
