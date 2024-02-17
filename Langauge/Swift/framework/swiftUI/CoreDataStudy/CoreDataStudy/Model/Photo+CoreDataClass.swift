//
//  Photo+CoreDataClass.swift
//  CoreDataStudy
//
//  Created by 유승철 on 2/12/24.
//
//

import Foundation
import CoreData
import SwiftUI

@objc(Photo)
public class Photo: NSManagedObject {
   
}

public class PhotoClass: Decodable {
   
    
    var albumId: Int32 = 0
    var id: Int64 = 0
    var title: String = ""
    var url: String = ""
    var thumbnailUrl: String = ""
    
    enum CodingKeys: String, CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
    
    
    public required convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.albumId = try container.decode(Int32.self, forKey: .albumId)
        self.id = try container.decode(Int64.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
        
    }
    
}

