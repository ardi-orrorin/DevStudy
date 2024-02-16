//
//  Photo.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/16/24.
//

import Foundation

func requestPhoto() -> [CodablePhoto] {
    var photo = [CodablePhoto]()
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            photo = try decoder.decode([CodablePhoto].self, from: data)
        } catch {
            print(error)
        }
    }
    task.resume()
    
    return photo
}
