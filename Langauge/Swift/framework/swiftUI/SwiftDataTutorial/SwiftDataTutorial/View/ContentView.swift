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
        
        NavigationStack {
            List {
                ForEach(photos) { photo in
                    NavigationLink(destination: SubView(photo: photo)) {
                        Text(photo.title)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle(Text("Albums"))
            .navigationBarItems(
                leading: HStack {
                    Button("Add") {
                        photoAPI.requestPhoto()
                        albumAPI.requestAlbum()
                    }
                },
                trailing: HStack {
                    Button("Delete All") {
                        photoService.deletePhotos(photos: photos)
                        albumService.deleteAlbums(albums: albums)
                    }
                }
            )
        }
       
    }
}



#Preview {
    ContentView()
}
