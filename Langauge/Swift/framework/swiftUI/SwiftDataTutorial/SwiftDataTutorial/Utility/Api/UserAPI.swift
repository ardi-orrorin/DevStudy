//
//  UserAPI.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/19/24.
//

import Foundation

class UserAPI {
    
    var service: UserSerivce
    
    init(service: UserSerivce) {
        self.service = service
    }
    
    func requestUser(){
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        let task = URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data else { return }
            
            do {
                let users = try JSONDecoder().decode([UserCodable].self, from: data)
                self.service.insertUsers(users: users)
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
}
