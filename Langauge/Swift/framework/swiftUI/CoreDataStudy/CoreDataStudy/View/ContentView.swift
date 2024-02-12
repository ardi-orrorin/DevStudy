//
//  ContentView.swift
//  CoreDataStudy
//
//  Created by 유승철 on 2/12/24.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @ObservedObject var photoModel = PhotoModel()
    
    @State private var refreshToggle = false
    
    var body: some View {
        
        VStack {
            HStack {
                Button("Request Photo") {
                    requestPhoto(photoModel: photoModel)
                    
                }
                Button("delete Photo") {
                    photoModel.initPhoto()
                    
                }
                Button("Refresh Image") {
                    refreshToggle.toggle()
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 4)
                ) {
                    ForEach(photoModel.photos) { photo in
                        
                        KFImage(URL(string: photo.url ?? "" ))
                            .resizable()
                            .scaledToFit()
                        
//                        AsyncImage(url: URL(string: photo.thumbnailUrl ?? "")) { image in
//                            
//                            switch image {
//                            case .success(let image):
//                                ZStack {
//                                    image.resizable()
//                                        .scaledToFit()
//                                    
//                                    Text(photo.url ?? "")
//                                        .foregroundColor(.white)
//                                        .font(.footnote)
//                                }
//                            case .failure(let image):
//                                ZStack {
//                                    Image(systemName: "xmark.app.fill")
//                                        .scaledToFit()
//                                        .frame(width: 80, height: 80)
//                                    
//                                    Text(photo.url ?? "")
//                                        .foregroundColor(.black)
//                                        .font(.footnote)
//                                }
//                            case .empty:
//                                ZStack {
//                                    Image(systemName: "photo.artframe")
//                                        .scaledToFit()
//                                        .frame(width: 80, height: 80)
//                                    
//                                    Text(photo.url ?? "")
//                                        .foregroundColor(.black)
//                                        .font(.footnote)
//                                }
//                            @unknown default:
//                                fatalError("e")
//                            }
//                        }
                    }
                }
            }
        }
        .padding()
        .onAppear(){
            photoModel.getPhotos()
        }

    }
}

#Preview {
    ContentView()
}
