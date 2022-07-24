//
//  CurrentMissions+CoreDataProperties.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/25.
//
//

import Foundation
import CoreData

extension CurrentMissions {
    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var dayOfMission: String
    @NSManaged public var status: String
    @NSManaged public var clearDate: String

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CurrentMissions> {
        return NSFetchRequest<CurrentMissions>(entityName: "CurrentMissions")
    }
}
