//
//  Photo.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/17/24.
//

import Foundation
import SwiftData

class PhotoAPI {
    var photos = [PhotoCodable]()
    var service: PhotoService
    
    init(service: PhotoService) {
        self.service = service
    }
       
    func requestPhoto() {
        let url = URL.init(string: "https://jsonplaceholder.typicode.com/photos")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let photos = try JSONDecoder().decode([PhotoCodable].self, from: data)
                self.service.insertPhotos(photos: photos)
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
}




