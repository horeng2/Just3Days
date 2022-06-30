//
//  ContentView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/06/29.
//

import SwiftUI

struct MenuTabBar: View {
    var body: some View {
            TabView {
                Text("오늘의 미션 뷰")
                .tabItem{
                    Image(systemName: "flame")
                    Text("Today")
                }
                Text("미션 뽑기 뷰")
                .tabItem{
                    Image(systemName: "die.face.5")
                    Text("Pick")
                }
                Text("미션 리스트 뷰")
                .tabItem{
                    Image(systemName: "scroll")
                    Text("List")
                }
                Text("나의 업적 뷰")
                .tabItem{
                    Image(systemName: "crown")
                    Text("Achieve")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MenuTabBar()
    }
}
