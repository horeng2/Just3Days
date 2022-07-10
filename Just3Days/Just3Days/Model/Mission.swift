//
//  Mission.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import Foundation

struct Mission: Identifiable {
    let id: String
    var emoji: String
    var title: String
    var possibleDay: MissionPossibleDay?
    var isSuccess: Bool
    var date: Date?
    
    init(title: String) {
        self.id = UUID().uuidString
        self.emoji = "🔥"
        self.title = title
        self.isSuccess = false
    }
}
