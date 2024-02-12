//
//  Entity.swift
//  CustomCalendar
//
//  Created by 유승철 on 2/11/24.
//
//

import Foundation
import SwiftData


@Model public class Image {
    var image: Data?
    var id: UUID?
    public init(image: Data, id: UUID) {
        self.image = image
        self.id = id
    }

    func getImage() -> Data {
        return image!
    }
    
    func getId() -> UUID {
        return id!
    }
}
