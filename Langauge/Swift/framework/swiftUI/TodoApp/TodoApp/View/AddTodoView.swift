//
//  AddTodoView.swift
//  TodoApp
//
//  Created by 유승철 on 2/8/24.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - properites
    
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    @Environment(\.presentationMode) var presentationMode
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - body
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - todo name
                    TextField("Todo", text: $name)
                    
                    
                    // MARK: - todo priority
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    // MARK: - save button
                    HStack {
                        Spacer()
                        Button {
                            print("Save a new todo item.")
                        } label: {
                            Text("Save")
                        }//: save button
                        Spacer()
                    }
                }//: form
                
                Spacer()
            } //: Vstack
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(
                trailing: Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                })
        } //: navigation
        
    }
}

#Preview {
    AddTodoView()
}
