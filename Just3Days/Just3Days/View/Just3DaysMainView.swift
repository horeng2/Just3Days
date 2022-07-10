//
//  Just3DaysMainView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import SwiftUI

struct Just3DaysMainView: View {
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView {
            TodaysMissionView(isSuccess: false)
                .tabItem{
                    Image(systemName: "flame")
                    Text("Today")
                }
            PickMissionView()
                .tabItem {
                    Image(systemName: "die.face.5")
                    Text("Pick")
                }
            MissionPresetView()
                .tabItem{
                    Image(systemName: "scroll")
                    Text("List")
                }
            MissionLogView()
                .tabItem{
                    Image(systemName: "crown")
                    Text("Achieve")
                }
        }
        .accentColor(ColorPalette.mainOrange.rgb())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Just3DaysMainView()
    }
}
