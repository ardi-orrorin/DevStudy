//
//  ContentView.swift
//  RestApiTest
//
//  Created by 유승철 on 2/11/24.
//

import SwiftUI
import CoreData




struct ContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    

    var fetch = FetchRequest<Album>(entity: Album.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Album.title, ascending: true)]) as FetchRequest<Album>
    var albums: FetchedResults<Album> {
        fetch.wrappedValue
    }

       
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack {
                ZStack {
                    HStack{
                        Spacer()
                        Text("Album")
                            .font(.headline)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Button {
                            getAlbums(page: 1, context: viewContext)
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                    
                    HStack {
                        Button {
                            deleteAlbums(to: viewContext)
                        } label: {
                            Image(systemName: "trash")
                        }
                        Spacer()
                    }
                }
            }
            List {
                ForEach(albums) { album in
                    Text("\(album.title ?? "Unknown")")
                }
            }
        }
        .padding()
    }
    

}

#Preview {
    ContentView()
}
