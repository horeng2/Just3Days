//
//  Log+CoreDataProperties.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/25.
//
//

import Foundation
import CoreData

extension Log {
    @NSManaged public var id: String
    @NSManaged public var title: String
    @NSManaged public var clearDate: String
    @NSManaged public var status: String
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Log> {
        return NSFetchRequest<Log>(entityName: "Log")
    }
}
