//
//  User.swift
//  SwiftDataTutorial
//
//  Created by 유승철 on 2/19/24.
//


import SwiftData

@Model
class User {
    var id: Int
    var name: String
    var email: String
    var phone: String
    var website: String
    var address: Address?
    var company: Company?
    
    
    init(id: Int, name: String, email: String, phone: String, website: String) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
    }
    
    init(id: Int, name: String, email: String, phone: String, website: String, address: Address) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
        self.address = address
    }
    
    init(id: Int, name: String, email: String, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
        self.company = company
    }

}

@Model
class Address {
    var street: String
    var suite: String
    var city: String
    var zipcode: String
    
    var geo: Geo?
    
    init(street: String, suite: String, city: String, zipcode: String) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
    }
    
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
}

@Model
class Company {
    var name: String
    var catchPhrase: String
    var bs: String
    
    init(name: String, catchPhrase: String, bs: String) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
}


@Model
class Geo {
    var lat: String
    var lng: String
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
}
