container.viewContext.delete(result)//
//  PhotoModel.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/13/24.
//

import Foundation
import CoreData

class PhotoModel: ObservableObject, Identifiable {
    @Published var photos = [Photo]()
    @Published var photo:Photo?
    
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
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        
        do {
            self.photos = try container.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
    }
    
    // MARK: - getPhoto
    func getPhoto(photoId: Int64) {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "photoId == &d", photoId)
        do {
            self.photo = try container.viewContext.fetch(fetchRequest).first
        } catch {
            print(error)
        }
    }
    
    // MARK: - addPhoto
    
    
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
