//
//  API.swift
//  RestApiTest
//
//  Created by 유승철 on 2/11/24.
//

import SwiftUI
import CoreData

func getAlbums(page: Int = 0, context: NSManagedObjectContext) {
    
    let urlStr = "https://jsonplaceholder.typicode.com/albums/" + String(page) + "/photos"
    
    let url = URL(string: urlStr)
    
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        if let data = data {
            do {
                let albums:[EntityAlbum] = try JSONDecoder().decode([EntityAlbum].self, from: data)
                                        
                for album in albums {
                    saveData(to: context, album: album)
                }
                    
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    task.resume()
}


func saveData(to context: NSManagedObjectContext, album: EntityAlbum) {
    
    let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()
    fetchRequest.predicate = NSPredicate(format: "id = %d", album.id)
    
    do {
        let result = try context.fetch(fetchRequest)
        if result.count > 0 {
            return
        } else {
            let entityAlbum = Album(context: context)
            
            entityAlbum.id = Int64(album.id)
            entityAlbum.title = album.title
            entityAlbum.url = album.url
            entityAlbum.thumbnailUrl = album.thumbnailUrl
            entityAlbum.albumId = Int16(album.albumId)
            try? context.save()
        }
    } catch {
        print(error.localizedDescription)
    }

    
    
}


func deleteAlbums(to context: NSManagedObjectContext) {
    let fetchRequest: NSFetchRequest<Album> = Album.fetchRequest()
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest as! NSFetchRequest<NSFetchRequestResult>)
    
    do {
        try context.execute(deleteRequest)
    } catch {
        print(error.localizedDescription)
    }
}
