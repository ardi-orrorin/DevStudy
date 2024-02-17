//
//  Photo.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/16/24.
//

import Foundation

func requestPhoto(photoModel: PhotoModel) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            let photo = try decoder.decode([CodableAlbum].self, from: data)
            photoModel.setPhotos(to: photo)
        } catch {
            print(error)
        }
    }
    task.resume()
}
