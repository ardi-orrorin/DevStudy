//
//  Get.swift
//  RestApiCall
//
//  Created by 유승철 on 2/10/24.
//

import Foundation

func getData() async -> [JSONdata]? {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else {
        print("Invalid URL")
        return nil
    }
    
    do {
        
        let (data, _) = try await URLSession.shared.data(from: url)
    
        print(data)
        
        let decoder = JSONDecoder()
        let jsonData = try? decoder.decode([JSONdata].self, from: data)
        
        return jsonData ?? nil
    } catch {
        print(error)
    }
    
    return nil
}
