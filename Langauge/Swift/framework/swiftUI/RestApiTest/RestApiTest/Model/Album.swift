//
//  Album.swift
//  RestApiTest
//
//  Created by 유승철 on 2/11/24.
//

import CoreData
import SwiftUI

struct EntityAlbum: Codable {
    let id: Int
    let albumId: Int
    let title: String
    let thumbnailUrl: String
    let url: String
}


