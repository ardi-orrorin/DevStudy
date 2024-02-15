//
//  AlbumModel.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/14/24.
//

import Foundation
import CoreData

class AlbumModel: ObservableObject, Identifiable {
    
    @Published var album: Album?
    @Published var albums: [Album]?
    
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
        let fetchRequest = Album.fetchRequest()
        
        do {
            self.albums = try container.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        
        
    }
    
    
    func getAlbum(albumId: Int64) {
        let fetchRequest = Album.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "albumId == %d", albumId)
        do {
            self.album = try container.viewContext.fetch(fetchRequest).first
            
        } catch {
            print(error)
        }
        
    }
    
    func removeAlbum(albumId: Int64) {
        let fetchRequest = Album.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "albumId == %d", albumId)
        do {
            self.album = try? container.viewContext.fetch(fetchRequest).first
            
            container.viewContext.delete(album!)
            
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
