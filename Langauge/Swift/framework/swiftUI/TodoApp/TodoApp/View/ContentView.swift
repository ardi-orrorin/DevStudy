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
    @State private var animatingButton: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
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
                                .environment(
                                    \.managedObjectContext,
                                     managedObjectContext
                                )
                        } //: sheet
                ) //: navigation bar items
                
                if todos.count == 0 {
                    EmptyListView()
                }
                
            } //: zstack
            .sheet(isPresented: $showingAddTodoView) {
                AddTodoView()
                    .environment(
                        \.managedObjectContext,
                         managedObjectContext
                    )
            } //: sheet
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(.blue)
                            .opacity(animatingButton ? 0.2 : 0)
                            .scaleEffect(animatingButton ? 1: 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        
                        Circle()
                            .fill(.blue)
                            .opacity(animatingButton ? 0.15 : 0)
                            .scaleEffect(animatingButton ? 1: 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    } //: circle group
                    
                    Button {
                        showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    } //: button
                } //: zstack
                .padding(.bottom, 15)
                .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
            .onAppear() {
                withAnimation(.easeInOut(duration: 2).repeatForever()) {
                    animatingButton.toggle()
                }
            }
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
