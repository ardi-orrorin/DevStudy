//
//  PhotoService.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/17/24.
//

import Foundation
import SwiftData
import SwiftUI

class PhotoService {
    
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func insertPhotos(photos: [PhotoCodable]) {
        for photo in photos {
            let photoModel = PhotoModel(
                albumId: photo.albumId,
                id: photo.id,
                title: photo.title,
                url: photo.url,
                thumbnailUrl: photo.thumbnailUrl
            )
            
            do {
                try self.context.insert(photoModel)
            } catch {
                print("Error inserting photo")
            }
            
            self.saveContext()
            
        }
    }
    
    func deletePhotos(photos: [PhotoModel]) {
        DispatchQueue.main.async {
            for photo in photos {
                do {
                    try self.context.delete(photo)
                    self.saveContext()
                } catch {
                    print("Error deleting photo")
                }
            }
            
        }
    }

    
    func saveContext(){
        do {
            try self.context.save()
        }catch {
            print("Error saving context")
        }
        
    }
}
