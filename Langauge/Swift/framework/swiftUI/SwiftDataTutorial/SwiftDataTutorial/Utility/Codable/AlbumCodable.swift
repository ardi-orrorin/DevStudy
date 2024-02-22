//
//  AlbumCodable.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/18/24.
//

import Foundation
import SwiftUI

struct AlbumCodable: Codable {
    var id: Int
    var userId: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userId
        case title
    }
    
    init(id: Int, userId: Int, title: String) {
        self.id = id
        self.userId = userId
        self.title = title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        userId = try container.decode(Int.self, forKey: .userId)
        title = try container.decode(String.self, forKey: .title)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(userId, forKey: .userId)
        try container.encode(title, forKey: .title)
    }
}
