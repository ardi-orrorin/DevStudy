//
//  UserSerivce.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/19/24.
//

import Foundation
import SwiftData

class UserService {
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    func insertUsers(users: [UserCodable]) {
        for user in users {
            var address: Address?
            if user.address != nil {
                var geo: Geo?
                if user.address?.geo != nil {
                    geo = Geo(lat: user.address!.geo!.lat, lng: user.address!.geo!.lng)
                }
                
                address = Address(
                    street: user.address?.street ?? "",
                    suite: user.address?.suite ?? "",
                    city: user.address?.city ?? "",
                    zipcode: user.address?.zipcode ?? "",
                    geo: geo ?? Geo(lat: "", lng: "")
                );
            }
            
            var company: Company?
            if user.company != nil {
                company = Company(
                    name: user.company?.name ?? "",
                    catchPhrase: user.company?.catchPhrase ?? "",
                    bs: user.company?.bs ?? ""
                )
            }
            
            let userModel = UserModel(
                id: user.id,
                name: user.name,
                email: user.email,
                phone: user.phone,
                website: user.website,
                address: address ?? Address(street: "", suite: "", city: "", zipcode: ""),
                company: company ?? Company(name: "", catchPhrase: "", bs: "")
            )
            
            do {
                try self.context.insert(userModel)
            } catch {
                print("Error inserting user")
            }
            
            self.saveContext()
        }
    }
    
    func saveContext(){
        try! self.context.save()
    }
    
    func deleteAllUsers() {
        do {
            
//            try self.context.deleteAll(UserModel.self)
        } catch {
            print("Error deleting all users")
        }
    }
}
