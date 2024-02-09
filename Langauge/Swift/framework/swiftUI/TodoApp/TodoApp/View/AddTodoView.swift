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
    @Environment(\.managedObjectContext) var managedObjectContext
    
    let priorities = ["High", "Normal", "Low"]
    
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    
    // MARK: - body
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    Form {
                        // MARK: - todo name
                        TextField("Todo", text: $name)
                            .padding()
                            .background(
                                Color(UIColor.tertiarySystemFill)
                            )
                            .cornerRadius(9)
                            .font(.system(size: 20, weight: .bold, design: .default))
                        
                        
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
                                if name != "" {
                                    let todo = Todo(context: managedObjectContext)
                                    todo.name = name
                                    todo.priority = priority
                                    
                                    do {
                                        try managedObjectContext.save()
                                    } catch {
                                        print(error)
                                    }
                                    
                                    print("New todo item: \(todo.name ?? ""), Priority: \(todo.priority ?? "")")
                                } else {
                                    errorShowing = true
                                    errorTitle = "Invalid Name"
                                    errorMessage = "Make sure to enter something for\nthe new todo item."
                                    return
                                }
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("Save")
                            }//: save button
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(9)
                            .foregroundColor(.white)
                            
                            Spacer()
                        } //: hstack
                        .padding(.horizontal)
                    } //: form
                } //: vstack
                Spacer()
            } //: Vstack
            .navigationBarTitle("New Todo", displayMode: .inline)
            .navigationBarItems(
                trailing: Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                })
            .alert(isPresented: $errorShowing){
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } //: navigation
    
        
    }
}

#Preview {
    AddTodoView()
}
