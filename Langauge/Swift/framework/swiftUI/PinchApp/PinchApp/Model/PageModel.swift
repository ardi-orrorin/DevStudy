//
//  PageModel.swift
//  PinchApp
//
//  Created by 유승철 on 1/20/24.
//

import Foundation


struct Page: Identifiable {
    let id: Int
    let imageName: String
}

extension Page {
    var thumbnailName: String {
        return  "thumb-" + imageName
    }
    
}

