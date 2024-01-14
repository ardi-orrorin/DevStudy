//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by 유승철 on 1/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    
    @Query var todos: [Todo] // only getter
    
    @State private var title = ""
    @State private var descriptionText = ""
    
    
    var body: some View {
        VStack {
            
            TextField("Title", text: $title)
            TextField("Description", text: $descriptionText)
            
            Button(action: {
                addTodo()
            }, label: {
                Text("Add")
            })
            
            ForEach(todos) { todo in
                Text("id: \(todo.id)")
                Spacer()
                Text("id: \(todo.title)")
            }
            
            
        }
    }
    
    func addTodo() {
        var todo = Todo(title: title, descriptionText: descriptionText)
        
    }
}

#Preview {
    ContentView()
        
}
