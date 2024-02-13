//
//  Photo+CoreDataProperties.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/13/24.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var userId: Int64
    @NSManaged public var malbum: Album?

}

extension Photo : Identifiable {

}
