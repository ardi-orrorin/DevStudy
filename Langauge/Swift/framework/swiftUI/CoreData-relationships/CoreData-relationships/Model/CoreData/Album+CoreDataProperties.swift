//
//  Album+CoreDataProperties.swift
//  Coredata-Relationships
//
//  Created by 유승철 on 2/13/24.
//
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album")
    }

    @NSManaged public var id: Int64
    @NSManaged public var thumbnailUrl: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var nphoto: NSOrderedSet?

}

// MARK: Generated accessors for nphoto
extension Album {

    @objc(insertObject:inNphotoAtIndex:)
    @NSManaged public func insertIntoNphoto(_ value: Photo, at idx: Int)

    @objc(removeObjectFromNphotoAtIndex:)
    @NSManaged public func removeFromNphoto(at idx: Int)

    @objc(insertNphoto:atIndexes:)
    @NSManaged public func insertIntoNphoto(_ values: [Photo], at indexes: NSIndexSet)

    @objc(removeNphotoAtIndexes:)
    @NSManaged public func removeFromNphoto(at indexes: NSIndexSet)

    @objc(replaceObjectInNphotoAtIndex:withObject:)
    @NSManaged public func replaceNphoto(at idx: Int, with value: Photo)

    @objc(replaceNphotoAtIndexes:withNphoto:)
    @NSManaged public func replaceNphoto(at indexes: NSIndexSet, with values: [Photo])

    @objc(addNphotoObject:)
    @NSManaged public func addToNphoto(_ value: Photo)

    @objc(removeNphotoObject:)
    @NSManaged public func removeFromNphoto(_ value: Photo)

    @objc(addNphoto:)
    @NSManaged public func addToNphoto(_ values: NSOrderedSet)

    @objc(removeNphoto:)
    @NSManaged public func removeFromNphoto(_ values: NSOrderedSet)

}

extension Album : Identifiable {

}
