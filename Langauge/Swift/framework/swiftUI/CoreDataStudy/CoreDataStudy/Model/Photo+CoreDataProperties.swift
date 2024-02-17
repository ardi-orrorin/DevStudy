//
//  Photo+CoreDataProperties.swift
//  CoreDataStudy
//
//  Created by 유승철 on 2/12/24.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var albumId: Int32
    
    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var thumbnailUrl: String?
    
}

extension Photo : Identifiable {
        
}
