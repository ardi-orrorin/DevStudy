//
//  RequestPhoto.swift
//  CoreDataStudy
//
//  Created by 유승철 on 2/12/24.
//

import Foundation
import CoreData

func requestPhoto(photoModel: PhotoModel) {
    
    let urlStr = "https://jsonplaceholder.typicode.com/albums/1/photos"
    
    let url = URL(string: urlStr)!
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            let decoder = JSONDecoder()
            if let decodedResponse = try? decoder.decode([PhotoClass].self, from: data) {
                photoModel.addPhotos(photoList: decodedResponse)
                photoModel.getPhotos()
                return
            }
        }
        print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
    }
    task.resume()
}
