//
//  ViewModel.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/08.
//

import Foundation
import Combine

class MissionPresetViewModel: ObservableObject {
    @Published var missionPreset = ["1": Mission(title: "1"), "2": Mission(title: "2"), "3": Mission(title: "3")]

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
