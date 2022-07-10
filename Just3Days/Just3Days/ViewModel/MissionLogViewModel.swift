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
    let missionPresetViewModel = MissionPresetViewModel()
    
    func save(_ mission: Mission, date: Date) {
        self.missionLog[date] = mission
    }
    
    func updateSuccess(_ mission: Mission, date: Date) {
        self.missionLog[date]?.isSuccess = true
    }
}
