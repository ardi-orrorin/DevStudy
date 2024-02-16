//
//  ContentView.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var photo: AlbumModel = AlbumModel()
    
    var body: some View {
        List {
            ForEach(photo.albums ?? []) { item in
                Text(item.title ?? "")
            }
        }
        .onAppear(){
            requestAlbum(albumModel: photo)
            photo.getAlbums()
        }
    }
}

#Preview {
    ContentView()
}
