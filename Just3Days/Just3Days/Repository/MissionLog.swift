//
//  UserData.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/06.
//

import Foundation
import RealmSwift

class MissionLog: Object {
    @objc dynamic var missionDate = Date()
    @objc dynamic var missionResult = false
}


