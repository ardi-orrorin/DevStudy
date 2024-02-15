//
//  DecodeAlbum.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/15/24.
//

import Foundation

class DecodeAlbum: Codable {
    
    var id: Int64
    var thumbnailUrl: String?
    var title: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case thumbnailUrl
        case title
        case url
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(String.self, forKey: .url)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(thumbnailUrl, forKey: .thumbnailUrl)
        try container.encode(title, forKey: .title)
        try container.encode(url, forKey: .url)
    }
    
}
