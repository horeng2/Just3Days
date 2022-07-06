//
//  UserData.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/06.
//

import Foundation
import RealmSwift

class UserData: Object {
    @objc dynamic var id = 0
    @objc dynamic var missionHistory = [Date: Bool]()
    let missionPreset = [SavedMission]()
}

class SavedMission: Object {
    @objc dynamic var name = ""
    @objc dynamic var emoji = "🔥"
    @objc dynamic var possibleDay = ""
}
