//
//  Mission.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import Foundation

struct Mission {
    let name: String
    let possibleDay: MissionDayOfTheWeek
}

enum MissionDayOfTheWeek {
    case allWeek
    case weekday
    case weekend
}
