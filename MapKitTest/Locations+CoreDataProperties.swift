//
//  Locations+CoreDataProperties.swift
//  MapKitTest
//
//  Created by Abhishek Jaykrishna Khapare on 7/20/17.
//  Copyright © 2017 Abhishek Jaykrishna Khapare. All rights reserved.
//
//

import Foundation
import CoreData


extension Locations {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Locations> {
        return NSFetchRequest<Locations>(entityName: "Locations")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?

}
