//
//  MissionLogViewModel.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/10.
//

import Foundation
import Combine

class MissionLogViewModel: ObservableObject {
    @Published var missionLog = [String: Mission]()
    @Published var currntMissionSet = [DayOfMission: Mission]()
    
    func saveMissionLog() {
        currntMissionSet.forEach { day, mission in
            self.missionLog[day.date] = mission
        }
        currntMissionSet.removeAll()
    }
    
    func saveCurrntMissionSet(_ missions: [DayOfMission: Mission]) {
        missions.forEach{ day, mission in
            self.currntMissionSet[day] = mission
        }
    }
    
    func updateMissionStatus(_ mission: Mission, isSuccess: Bool) {
        self.missionLog[Date().toString()]?.isChecked = true
        
        if isSuccess {
            self.missionLog[Date().toString()]?.isSuccess = true
        }
    }
    
    func fetchTodayMission(today: Date) -> Mission? {
        guard let mission = self.currntMissionSet.filter({ $0.key.date == today.toString() }).values.first else {
            return nil
        }
        
        return mission
    }
    
    func fetchCurrentMissions() -> [DayOfMission: Mission] {
        return currntMissionSet
    }
}
