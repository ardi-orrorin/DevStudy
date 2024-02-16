//
//  Album.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/16/24.
//

import Foundation

func RequestAlbum() -> [CodableAlbum] {
    var albums: [CodableAlbum] = []
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            albums = try decoder.decode([CodableAlbum].self, from: data)
        } catch {
            print(error)
        }
    }
    task.resume()
    
    return albums
}
