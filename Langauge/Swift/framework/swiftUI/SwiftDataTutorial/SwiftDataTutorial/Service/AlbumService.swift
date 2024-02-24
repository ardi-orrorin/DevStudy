//
//  AlbumService.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/18/24.
//

import Foundation
import SwiftData

class AlbumService {
    
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func insertAlbums(albums: [AlbumCodable]) {
        for album in albums {
            let albumModel = AlbumModel(
                id: album.id,
                userId: album.userId,
                title: album.title
            )
            
            do {
                try self.context.insert(albumModel)
            } catch {
                print("Error inserting album")
            }
            
            self.saveContext()
            
        }
    }
    
    func deleteAlbums(albums: [AlbumModel]) {
        DispatchQueue.main.async {
            for album in albums {
                do {
                    try self.context.delete(album)
                    self.saveContext()
                } catch {
                    print("Error deleting album")
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
