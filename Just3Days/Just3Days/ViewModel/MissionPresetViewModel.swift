//
//  ViewModel.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/08.
//

import Foundation
import Combine

class MissionPresetViewModel: ObservableObject {
    @Published var missionPreset = [String: Mission]()
    
    init() {

        self.missionPreset = ["1": Mission(title: "제리똥치우기"),
                              "2": Mission(title: "무도가 만렙찍기"),
                              "3": Mission(title: "책상정리")]
    }

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
