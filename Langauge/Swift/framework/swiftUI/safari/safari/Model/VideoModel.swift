//
//  VideoModel.swift
//  safari
//
//  Created by 유승철 on 1/22/24.
//

import Foundation


struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
    
}
