//
//  Just3DaysMainView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import SwiftUI

struct Just3DaysMainView: View {
    @State var index = 0
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @EnvironmentObject var missionLogViewModel: MissionLogViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $index) {
            TodaysMissionView()
                .tabItem{
                    Image(systemName: "flame")
                    Text("Today")
                }
                .tag(0)
            PickMissionView(missionLogViewModel: missionLogViewModel, pickedMissions: missionLogViewModel.fetchCurrentMissions(),index: $index)
                .tabItem {
                    Image(systemName: "die.face.5")
                    Text("Pick")
                }
                .tag(1)
            MissionPresetView()
                .tabItem{
                    Image(systemName: "scroll")
                    Text("List")
                }
                .tag(2)
            MissionLogView()
                .tabItem{
                    Image(systemName: "crown")
                    Text("Achieve")
                }
                .tag(3)
        }
        .accentColor(ColorPalette.mainOrange.rgb())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Just3DaysMainView()
    }
}
