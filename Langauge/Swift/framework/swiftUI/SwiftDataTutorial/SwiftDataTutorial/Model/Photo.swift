//
//  Photo\.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/17/24.
//

import Foundation
import SwiftData

 @Model
 class PhotoModel {
     @Attribute(.unique) var id: Int
     var albumId: Int
     var title: String
     var url: String
     var thumbnailUrl: String

     init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
         self.albumId = albumId
         self.id = id
         self.title = title
         self.url = url
         self.thumbnailUrl = thumbnailUrl
     }
 }
