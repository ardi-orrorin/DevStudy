//
//  AlbumModel.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/14/24.
//

import Foundation
import CoreData

class AlbumModel: ObservableObject, Identifiable {
    
    @Published var album: Photo = Photo()
    @Published var albums: [Photo] = [Photo]()
    
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Album")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error Core Data \(error)")
            }
        }
    }
    
    func getAlbums(){
        let fetchRequest = Photo.fetchRequest()
        
        do {
            self.albums = try container.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    func getAlbumsContains(){
        let fetchRequest = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title CONTAINS[c] %@", "sunt")
        
        do {
            self.albums = try container.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    
    func getAlbum(albumId: Int64) {
        let fetchRequest = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "albumId == %d", albumId)
        do {
            self.album = try container.viewContext.fetch(fetchRequest).first ?? Photo()
            
        } catch {
            print(error)
        }
        
    }
    
    func setAlbum(album: CodablePhoto) {
        
        let album = Album(context: container.viewContext)
        album.id = album.id
        album.thumbnailUrl = album.thumbnailUrl
        album.title = album.title
        album.url = album.url
        
        container.viewContext.insert(album)
        self.saveContext()
    }
    
    func setAlbums(albums: [CodablePhoto]) {
        DispatchQueue.main.async {
            for item in albums {
                let album = Photo(context: self.container.viewContext)
                album.id = item.id
                album.title = item.title
                album.userId = item.userId
                
                self.container.viewContext.insert(album)
            }
        }
        self.saveContext()
    }
    
    
    func removeAlbum(albumId: Int64) {
        let fetchRequest = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "albumId == %d", albumId)
        do {
            
            self.album = try container.viewContext.fetch(fetchRequest).first ?? Photo()
            
            if(self.album.id != 0) {
                container.viewContext.delete(album)
            }
            
            self.saveContext()
        } catch {
            print(error)
        }
    }
    
    func saveContext(){
        do {
            try container.viewContext.save()
        } catch {
            print("Not saved. \(error)")
        }
    }
    
    
}
