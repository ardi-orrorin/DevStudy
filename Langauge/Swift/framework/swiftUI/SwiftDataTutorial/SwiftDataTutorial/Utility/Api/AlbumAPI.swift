//
//  AlbumAPI.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/18/24.
//

import Foundation

class AlbumAPI {
    
    var service: AlbumService
    
    init(service: AlbumService) {
        self.service = service
    }
    
    func requestAlbum(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data else { return }
            
            do {
                let albums = try JSONDecoder().decode([AlbumCodable].self, from: data)
                self.service.insertAlbums(albums: albums)
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
}
