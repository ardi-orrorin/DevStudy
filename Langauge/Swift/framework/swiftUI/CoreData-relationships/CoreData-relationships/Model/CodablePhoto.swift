//
//  CodablePhoto.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/15/24.
//

import Foundation

class CodablePhoto: Codable {
    var id: Int64
    var title: String?
    var userId: Int64
    var malum: Album?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case userId
        case album
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        userId = try container.decode(Int64.self, forKey: .userId)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(userId, forKey: .userId)
    }
}
