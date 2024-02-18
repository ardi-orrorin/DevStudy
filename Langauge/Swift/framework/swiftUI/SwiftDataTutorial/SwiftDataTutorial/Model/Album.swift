//
//  Album.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/18/24.
//


import SwiftData

@Model
class AlbumModel {
    @Attribute(.unique) var id: Int
    var userId: Int
    var title: String
    
    @Relationship(deleteRule: .cascade) var photos: [PhotoModel] = []
    
    init(id: Int, userId: Int, title: String, photos: [PhotoModel]) {
        self.id = id
        self.userId = userId
        self.title = title
        self.photos = photos
    }
    
    init(id: Int, userId: Int, title: String) {
        self.id = id
        self.userId = userId
        self.title = title
    } 
    
}
