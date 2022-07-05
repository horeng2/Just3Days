//
//  d.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation

enum MissionPossibleDay: CaseIterable {
    case allWeek
    case weekday
    case weekend
    
    func message() -> String {
        switch self {
        case .allWeek:
            return "언제나 할 수 있어요."
        case .weekday:
            return "평일에만 가능해요."
        case .weekend:
            return "주말에만 할래요."
        }
    }
}
