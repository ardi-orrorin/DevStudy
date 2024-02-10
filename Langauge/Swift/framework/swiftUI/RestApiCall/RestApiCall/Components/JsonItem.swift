//
//  JsonItem.swift
//  RestApiCall
//
//  Created by 유승철 on 2/10/24.
//

import SwiftUI

struct JsonItem: View {
    
    var jsonData: JSONdata
    
    var body: some View {
        VStack {
            Text("Post ID: \(jsonData.postId)")
                .font(.title)
                .padding()
            Text("ID: \(jsonData.id)")
                .font(.title)
                .padding()
            Text("Name: \(jsonData.name)")
                .font(.title)
                .padding()
            Text("Email: \(jsonData.email)")
                .font(.title)
                .padding()
            Text("Body: \(jsonData.body)")
                .font(.title)
                .padding()
        }
    }
}

