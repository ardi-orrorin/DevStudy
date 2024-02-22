import SwiftData
import SwiftUI

// @Model
// class PhotoModel {
//     @Attribute(.unique) var id: Int
//     var albumId: Int
//     var title: String
//     var url: String
//     var thumbnailUrl: String

//     init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
//         self.albumId = albumId
//         self.id = id
//         self.title = title
//         self.url = url
//         self.thumbnailUrl = thumbnailUrl
//     }
// }


struct Photo: Decodable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String

    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try container.decode(Int.self, forKey: .albumId)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
        thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }
}


func requestPhotos() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            print("Data: \(data)")
            
            let photos:[Photo] = try! JSONDecoder().decode([Photo].self, from: data)
            print(photos)
        }
    }
    task.resume()
}

requestPhotos()

