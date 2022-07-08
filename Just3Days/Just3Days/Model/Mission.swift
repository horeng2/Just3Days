//
//  Mission.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import Foundation

struct Mission: Identifiable {
    let id: String
    let emoji: String
    let name: String
    let possibleDay: MissionPossibleDay
    
    init(emoji: String, name: String, possibleDay: MissionPossibleDay) {
        self.id = UUID().uuidString
        self.emoji = emoji
        self.name = name
        self.possibleDay = possibleDay
    }
}
