//
//  Preset+CoreDataProperties.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/25.
//
//

import Foundation
import CoreData

extension Preset {
    @NSManaged public var id: String
    @NSManaged public var emoji: String
    @NSManaged public var title: String
    @NSManaged public var possibleDay: String
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Preset> {
        return NSFetchRequest<Preset>(entityName: "Preset")
    }
}
