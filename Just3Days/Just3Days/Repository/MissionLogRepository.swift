//
//  MissionInfoRefository.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/07.
//

import Foundation
import RealmSwift

class MissionLogRepository {
    let realm = try! Realm()
    
    func create(missionsLog: MissionLog) {
        try! realm.write {
            realm.add(missionsLog)
        }
    }
    
    func retrieve(of date: Date?) -> Results<MissionLog> {
        let result = realm.objects(MissionLog.self)
        guard let dateFilter = date else {
            return result
        }
        let predicate = NSPredicate(format: "date = %@", dateFilter as CVarArg)
        return result.filter(predicate)
    }
}


