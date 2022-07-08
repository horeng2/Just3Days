//
//  Just3DaysApp.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import SwiftUI

@main
struct Just3DaysApp: App {
    @StateObject var missionPresetViewModel = MissionPresetViewModel()
    
    var body: some Scene {
        WindowGroup {
            Just3DaysMainView()
                .environmentObject(missionPresetViewModel)
        }
    }
}
