//
//  User.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/19/24.
//

import Foundation
import SwiftUI

struct UserCodable: Codable {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var website: String
    var address: AddressCodable?
    var company: CompanyCodable?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case email
        case phone
        case website
        case address
        case company
    }
    
    init(id: Int, name: String, email: String, phone: String, website: String) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        email = try container.decode(String.self, forKey: .email)
        phone = try container.decode(String.self, forKey: .phone)
        website = try container.decode(String.self, forKey: .website)
        address = try container.decode(AddressCodable.self, forKey: .address)
        company = try container.decode(CompanyCodable.self, forKey: .company)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(phone, forKey: .phone)
        try container.encode(website, forKey: .website)
        try container.encode(address, forKey: .address)
        try container.encode(company, forKey: .company)
    }
}



