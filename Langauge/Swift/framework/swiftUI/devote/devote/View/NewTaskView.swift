//
//  NewTaskViewq.swift
//  devote
//
//  Created by 유승철 on 1/30/24.
//

import SwiftUI

struct NewTaskView: View {
    @AppStorage("isDrakMode") private var isDarkMode: Bool = false
    
    @State private var task: String = ""
    @Binding var isShowing: Bool
    
    @Environment(\.managedObjectContext) private var viewContext
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    var body: some View {
        VStack{
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode 
                        ? Color(UIColor.tertiarySystemBackground)
                        : Color(UIColor.secondarySystemBackground)
                        
                    )
                    .cornerRadius(10)
                
                Button {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                    feedback.notificationOccurred(.success)
                } label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                }
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                        feedback.notificationOccurred(.success)
                    }
                }
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            }//: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(
                isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//: Vstask
        .padding()
    }
    
    
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
            
        }
    }
}

#Preview {
    NewTaskView(isShowing: .constant(true))
}
