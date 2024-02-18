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
    @Query(
        filter: #Predicate<AlbumModel>{ $0.title.contains("velit")},
        sort: [SortDescriptor(\AlbumModel.id, order: .forward)]
    )
    var albums: [AlbumModel]
    
    var body: some View {
        let photoService = PhotoService(context: context)
        let photoAPI = PhotoAPI(service: photoService)
        let albumService = AlbumService(context: context)
        let albumAPI = AlbumAPI(service: albumService)
        
        VStack {
            HStack {
                VStack{
                    Button("Add") {
//                        photoAPI.requestPhoto()
                        albumAPI.requestAlbum()
                    }
                }
                Spacer()
                VStack {
                    
                }
                
                Spacer()
                VStack {
                    Button("Delete All") {
                        photoService.deletePhotos(photos: photos)
                        albumService.deleteAlbums(albums: albums)
                    }
                }
            }
            
            List {
                ForEach(albums) { album in
                    Text(album.title)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        do {
                            context.delete(albums[index])
                            try context.save()
                        } catch {
                            print(error)
                        }
                         
                    }
                })
                
                
//                ForEach(photos) { item in
//                    Text(item.title)
//                }
//                .onDelete(perform: { indexSet in
//                    for index in indexSet {
//                        context.delete(photos[index])
//                        do {
//                          try context.save()
//                        } catch {
//                            print(error)
//                        }
//                    }
//                })
            }
        }
    }
}



#Preview {
    ContentView()
}
