//
//  PhotoModel.swift
//  CoreDataStudy
//
//  Created by 유승철 on 2/12/24.
//

import Foundation
import CoreData

class PhotoModel: ObservableObject {
    
    
    @Published(initialValue: [Photo]) var photos = [Photo]()
    
    let container: NSPersistentContainer
    
    init () {
        container = NSPersistentContainer(name: "Photo")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
            
        }
    }
    
    func getPhotos() {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        do {
            self.photos = try container.viewContext.fetch(fetchRequest)
        } catch {
            print(error)
        }
        
    }
    
    func addPhoto(id: Int64, albumId:  Int32, title: String, url: String, thumbnailUrl: String) {
        let photo = Photo(context: container.viewContext)
        photo.id             = id
        photo.albumId        = albumId
        photo.title          = title
        photo.url            = url
        photo.thumbnailUrl   = thumbnailUrl
        
        self.saveContext()
    }
    
    func addPhotos(photoList: [PhotoClass]) {
        for item in photoList {
            DispatchQueue.main.sync {
                self.addPhoto(id: item.id, albumId: item.albumId, title: item.title, url: item.url, thumbnailUrl: item.thumbnailUrl)
            }
        }
    }
    
    
    func initPhoto() {
        let fetchRequest: NSFetchRequest<Photo> = Photo.fetchRequest()
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            for photo in result {
                container.viewContext.delete(photo)
            }
            saveContext()
            self.photos = [Photo]()
        } catch {
            
        }
        
    }
    
    func saveContext() {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("Error saving Core Data. \(error)")
            }
        }
    }
}

