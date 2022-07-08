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

    func fetch() -> [Mission] {
        return missionPreset.map{ $0.value }
    }
        
    func create(_ mission: Mission) {
        self.missionPreset[mission.id] = mission
    }
    
    func update(_ mission: Mission) {
        self.missionPreset.updateValue(mission, forKey: mission.id)
    }
    
    func delete(_ mission: Mission) {
        self.missionPreset.removeValue(forKey: mission.id)
    }
}
