//
//  ContentView.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var context
    
    @Query(sort: \PhotoModel.id) var photos: [PhotoModel]
    
    var body: some View {
        let photoService = PhotoService(context: context)
        let photoAPI = PhotoAPI(service: photoService)
        VStack {
            
            HStack {
                VStack{
                    Button("Add") {
                        photoAPI.requestPhoto()
                    }
                }
                Spacer()
                VStack {
                    
                }
                
                Spacer()
                VStack {
                    Button("Delete All") {
                        photoService.deletePhotos(photos: photos)
                    }
                }
            }
            
            List {
                ForEach(photos) { item in
                    Text(item.title)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(photos[index])
                        do {
                          try context.save()
                        } catch {
                            print(error)
                        }
                    }
                })
            }
        }
    }
}



#Preview {
    ContentView()
}
