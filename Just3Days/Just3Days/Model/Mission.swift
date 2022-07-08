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
    
    init(title: String) {
        self.id = UUID().uuidString
        self.emoji = "🔥"
        self.title = title
    }
}
