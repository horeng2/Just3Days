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
    
    func fetchCurrentMissions() -> [DayOfMission: Mission] {
        return currentMissionSet
    }
    
    func fetchTodayMission(today: Date) -> Mission? {
        guard let mission = self.currentMissionSet.filter({ $0.key.date == today.toString() }).values.first else {
            return nil
        }
        return mission
    }
    
    func fetchMissionClearCount(filter: MissionClear) -> Int {
        let count: Int = {
            switch filter {
            case .setClear:
                return self.missionLog.filter{ $0.value.status == .setClear || $0.value.status == .perfectClear}.count
            case .perfectClear:
                return self.missionLog.filter{ $0.value.status == .perfectClear }.count
            case .clear:
                return self.missionLog.filter{ $0.value.status == .clear }.count
            case .failure:
                return self.missionLog.filter{ $0.value.status == .failure }.count
            }
        }()
        
        return count
    }
    
    func saveCurrntMissionSet(_ missions: [DayOfMission: Mission]) {
        missions.forEach{ day, mission in
            var mission = mission
            mission.clearDate = day.date
            self.currentMissionSet[day] = mission
        }
    }
    
    func updateMissionStatus(_ mission: Mission, isSuccess: Bool) {
        guard let missionDay = mission.dayOfMission else {
            return
        }
    
        if isSuccess {
            currentMissionSet[missionDay]?.status = .perfectClear
        }
        missionLog[Date.now.toString()] = currentMissionSet[missionDay]

        if mission.dayOfMission == .thirdDay {
            self.clearMissionSet()
        }
    }
    
    func clearMissionSet() {
        let successCount = currentMissionSet.filter{ $0.value.status == .perfectClear }.count
      
        if successCount >= 2 {
            currentMissionSet.forEach { day, mission in
                var mission = mission
                if mission.status == .failure {
                    mission.status = .clear
                }
                self.missionLog[mission.clearDate ?? ""] = mission
            }
        }
        currentMissionSet.removeAll()
    }
}

enum MissionClear {
    case setClear
    case perfectClear
    case clear
    case failure
}
