//
//  JSON.swift
//  RestApiCall
//
//  Created by 유승철 on 2/10/24.
//

import SwiftUI

struct JSONdata: Codable {
    var postId : Int
    var id     : Int
    var name   : String
    var email  : String
    var body   : String
}
