//
//  ViewIndex.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/21.
//

import Foundation

enum ViewIndex {
    case todaysMissionView
    case PickMissionView
    case MissionPresetView
    case EditMissionView
    case MissionLogView
    
    var index: Int = {
        switch self {
        case .todaysMissionView:
            return 0
        case .PickMissionView:
            return 1
        case .MissionPresetView:
            return 2
        case .EditMissionView:
            return 3
        case .MissionLogView:
            return 4
        }
    }
}
