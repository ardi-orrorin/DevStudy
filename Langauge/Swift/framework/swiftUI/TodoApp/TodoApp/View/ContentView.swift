//
//  ContentView.swift
//  TodoApp
//
//  Created by 유승철 on 2/8/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>

    @State private var showingAddTodoView: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(todos, id: \.self) { todo in
                    HStack {
                        Text(todo.name ?? "Unknown")
                        
                        Spacer()
                        
                        Text(todo.priority ?? "Unknown")
                    } //: hstack
                } //: foreach
                .onDelete(perform: deleteTodo)
            } //: list
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(
                leading : EditButton(),
                trailing: Button {
                    showingAddTodoView.toggle()
                } label: {
                    Image(systemName: "plus")
                } //: button
                    .sheet(isPresented: $showingAddTodoView) {
                        AddTodoView()
                            .environment(\.managedObjectContext, managedObjectContext)
                    }
            ) //: navigation bar items
        } //: navigation view
    }
    
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            managedObjectContext.delete(todo)
            
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
        }
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView()
}
