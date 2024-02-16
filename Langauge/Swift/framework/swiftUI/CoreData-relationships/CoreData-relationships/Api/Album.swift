//
//  Album.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/16/24.
//

import Foundation

func requestAlbum(albumModel: AlbumModel) {
        
    let url = URL(string: "https://jsonplaceholder.typicode.com/albums")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        let reulst = try! decoder.decode([CodablePhoto].self, from: data!)
        albumModel.setAlbums(albums: reulst)
    }
    task.resume()
    
}
