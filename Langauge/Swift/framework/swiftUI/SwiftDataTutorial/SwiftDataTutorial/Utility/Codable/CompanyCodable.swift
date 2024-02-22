//
//  CompanyCodable.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/19/24.
//

import Foundation

struct CompanyCodable: Codable {
    var name: String
    var catchPhrase: String
    var bs: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case catchPhrase
        case bs
    }
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        catchPhrase = try container.decode(String.self, forKey: .catchPhrase)
        bs = try container.decode(String.self, forKey: .bs)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(catchPhrase, forKey: .catchPhrase)
        try container.encode(bs, forKey: .bs)
    }
}
