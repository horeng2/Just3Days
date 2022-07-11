//
//  MissionLogViewModel.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/10.
//

import Foundation
import Combine

class MissionLogViewModel: ObservableObject {
    @Published var missionLog = [Date: Mission]()
    @Published var currntMissionSet = [DayOfMission: Mission]()
    let missionPresetViewModel = MissionPresetViewModel()
    
    func endMissionSet() {
        currntMissionSet.forEach { day, mission in
            self.missionLog[day.date] = mission
        }
        currntMissionSet.removeAll()
    }
    
    func saveMissionSet(_ missions: [DayOfMission: Mission]) {
        self.currntMissionSet = missions
    }
    
    func updateSuccess(_ mission: Mission, date: Date) {
        self.missionLog[date]?.isSuccess = true
    }
    
    func fetch() -> [DayOfMission: Mission] {
        var missionSet = [DayOfMission: Mission]()
        if currntMissionSet.isEmpty {
            DayOfMission.allCases.forEach { day in
                missionSet[day] = Mission(title: "미션을 뽑아주세요.")
            }
        } else {
            missionSet = currntMissionSet
        }
        
        return missionSet
    }
}
