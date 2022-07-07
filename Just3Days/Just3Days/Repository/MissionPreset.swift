//
//  MissionPreset.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/07.
//

import Foundation
import RealmSwift

class MissionPreset: Object {
    @objc dynamic var name = ""
    @objc dynamic var emoji = "🔥"
    @objc dynamic var possibleDay = ""
}
