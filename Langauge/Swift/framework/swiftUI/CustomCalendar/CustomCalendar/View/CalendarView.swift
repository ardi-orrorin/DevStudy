//
//  CalendarView.swift
//  CustomCalendar
//
//  Created by 유승철 on 2/10/24.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    @State private var memo = ""
    @State private var dateOption: DatePickerComponents = [.date, .hourAndMinute]
    
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        
        let startComponents = DateComponents(year: 2024, month: 1, day: 1)
        let endComponents = DateComponents(year: 2024, month: 1, day: 31)
        return calendar.date(from: startComponents)!...calendar.date(from: endComponents)!
    }()
    
    var body: some View {
        VStack(spacing: 12) {
            DatePicker(
                "Select a date",
                selection: $date,
                in: dateRange,
                displayedComponents: dateOption
            )
            .datePickerStyle(.graphical)
            
            Divider()
            
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
            
            Spacer()
            
            Divider()
            
            HStack {
                Button {
                    print("date: \(date), memo: \(memo)")
                } label :{
                    Text("Save")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
                Button {
                    
                } label :{
                    Text("Cancel")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            .frame(maxHeight: 30)
            
            
            
            
        }
    }
}

#Preview {
    CalendarView()
}
