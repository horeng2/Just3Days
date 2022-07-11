//
//  ViewModel.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/08.
//

import Foundation
import Combine

class MissionPresetViewModel: ObservableObject {
    @Published var missionPreset = ["1": Mission(title: "제리 똥 치우기"), "2": Mission(title: "아침밥 먹기"), "3": Mission(title: "레벨링 던전 돌기"),
                                    "4": Mission(title: "제리랑 놀아주기"), "5": Mission(title: "자기 전 스트레칭"), "6": Mission(title: "책상 정리")]

    func fetch() -> [Mission] {
        return self.missionPreset.map{ $0.value }
    }
        
    func save(_ mission: Mission, isModifyMode: Bool) {
        if isModifyMode {
            self.update(mission)
        } else {
            self.missionPreset[mission.id] = mission
        }
    }
    
    func update(_ mission: Mission) {
        self.missionPreset.updateValue(mission, forKey: mission.id)
    }
    
    func delete(_ mission: Mission) {
        self.missionPreset.removeValue(forKey: mission.id)
    }
}
