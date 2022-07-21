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
    @Published var currentMissionSet = [DayOfMission: Mission]()
    
    func saveMissionLog() {
        let successCount = currentMissionSet.filter{ $0.value.isSuccess }.count

        currentMissionSet.forEach { day, mission in
            if successCount >= 2 {
                currentMissionSet[day]?.setClear = true
            }
            self.missionLog[day.date] = mission
        }
        
        currentMissionSet.removeAll()
    }
    
    func saveCurrntMissionSet(_ missions: [DayOfMission: Mission]) {
        missions.forEach{ day, mission in
            self.currentMissionSet[day] = mission
        }
    }
    
    func updateMissionStatus(_ mission: Mission, isSuccess: Bool) {
        self.missionLog[Date().toString()]?.isChecked = true
        
        if isSuccess {
            self.missionLog[Date().toString()]?.isSuccess = true
        }
        
        if mission.dayOfMission == .thirdDay {
            self.saveMissionLog()
        }
    }
    
    func fetchTodayMission(today: Date) -> Mission? {
        guard let mission = self.currentMissionSet.filter({ $0.key.date == today.toString() }).values.first else {
            return nil
        }
        
        return mission
    }
    
    func fetchCurrentMissions() -> [DayOfMission: Mission] {
        return currentMissionSet
    }
}
