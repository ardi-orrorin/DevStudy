//  PhotoModel.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/13/24.
//

import Foundation
import CoreData

class PhotoModel: ObservableObject, Identifiable {
    
    @Published var photos: [Album] = [Album]()
    @Published var photo:Album = Album()
    
    let container: NSPersistentContainer
    
    // MARK: - init
    init() {
        container = NSPersistentContainer(name: "Photo")
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Error loading Core Data \(error)")
            }
            
        }
    }
    
    // MARK: - getPhotos
    func getPhotos(){
        let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()
        
        do {
            self.photos = try container.viewContext.fetch(fetchRequest)
            print(self.photos)
        } catch {
            print(error)
        }
    }
    
    // MARK: - getPhoto
    func getPhoto(photoId: Int64) {
        let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "photoId == &d", photoId)
        do {
            self.photo = try container.viewContext.fetch(fetchRequest).first ?? Album()
        } catch {
            print(error)
        }
    }
    
    // MARK: - addPhoto
    func setPhoto(to: CodableAlbum) {
        let photo = Album(context: container.viewContext)
        photo.id = to.id
        photo.thumbnailUrl = to.thumbnailUrl
        photo.title = to.title
        photo.url = to.url
        
        self.container.viewContext.insert(photo)
        self.saveContext()
    }
    
    // MARK: - addPhotos
    func setPhotos(to: [CodableAlbum]) {
        for item in to {
            let photo = Album(context: container.viewContext)
            photo.id = item.id
            photo.thumbnailUrl = item.thumbnailUrl
            photo.title = item.title
            photo.url = item.url
            self.container.viewContext.insert(photo)
            self.saveContext()
        }
    }
    
    
    // MARK: - removePhoto
    func removePhoto(photoId: Int64) {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "photoId == &d", photoId)
        
        do {
            let result = try container.viewContext.fetch(fetchRequest).first
            
            if result != nil {
                container.viewContext.delete(result!)
            }
            self.saveContext()
        } catch {
            print(error)
        }
    }
    
    // MARK: - saveContext
    func saveContext(){
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("Error")
            }
        }
    }
    
}
