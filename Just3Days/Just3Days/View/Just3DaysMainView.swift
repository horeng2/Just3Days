//
//  Just3DaysMainView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import SwiftUI

struct Just3DaysMainView: View {
    @State var index = ViewIndex.todaysMissionView.index
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @EnvironmentObject var missionLogViewModel: MissionLogViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $index) {
            TodaysMissionView(index: $index)
                .tabItem{
                    Image(systemName: "flame")
                    Text("Today")
                }
                .tag(ViewIndex.todaysMissionView.index)
            PickMissionView(pickedMissions: missionLogViewModel.fetchCurrentMissions(),index: $index)
                .tabItem {
                    Image(systemName: "die.face.5")
                    Text("Pick")
                }
                .tag(ViewIndex.PickMissionView.index)
            MissionPresetView()
                .tabItem{
                    Image(systemName: "scroll")
                    Text("List")
                }
                .tag(ViewIndex.MissionPresetView.index)
            MissionLogView()
                .tabItem{
                    Image(systemName: "crown")
                    Text("Achieve")
                }
                .tag(ViewIndex.MissionLogView.index)
        }
        .accentColor(ColorPalette.mainOrange.rgb())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Just3DaysMainView()
    }
}
