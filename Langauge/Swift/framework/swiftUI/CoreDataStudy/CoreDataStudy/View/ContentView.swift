//
//  ContentView.swift
//  CoreDataStudy
//
//  Created by 유승철 on 2/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var photoModel = PhotoModel()
    
    var body: some View {
        
        VStack {
            HStack {
                Button("Request Photo") {
                    requestPhoto(photoModel: photoModel)
                    
                }
                Button("delete Photo") {
                    photoModel.initPhoto()
                    
                }
            }
            List {
                ForEach(photoModel.photos) { photo in
                    Text(photo.title ?? "Unknown")
                }
            }
        }
        .padding()

    }
}

#Preview {
    ContentView()
}
