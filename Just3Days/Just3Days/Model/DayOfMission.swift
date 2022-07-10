//
//  DaysOfMissionSet.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import Foundation

enum DayOfMission: CaseIterable {
    case firstDay
    case secondDay
    case thirdDay
    
    var discription: String {
        switch self {
        case .firstDay:
            return "시작하는 날"
        case .secondDay:
            return "벌써 반이나 지난 날"
        case .thirdDay:
            return "끝나는 날"
        }
    }
}
