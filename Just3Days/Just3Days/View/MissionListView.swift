//
//  MissionListView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct MissionListView: View {
    @State var isShowAddMissonView  = false
    @State var missions = [
        Mission(emoji: "🌤", name: "이불정리하기", possibleDay: .allWeek),
        Mission(emoji: "🧗‍♀️", name: "운동하기", possibleDay: .weekend)
    ]
    
    var body: some View {
        VStack {
            MissionListHeaderView(isShowAddMissonView: $isShowAddMissonView)
            MissionListContentView(missions: $missions)
        }
    }
}

struct MissionListHeaderView: View {
    @Binding var isShowAddMissonView: Bool
    
    var body: some View {
        HStack {
            Text("리스트")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.top)
            Spacer()
            Button {
                isShowAddMissonView = true
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .fullScreenCover(isPresented: $isShowAddMissonView) {
                        AddMissionView(isAddMissionView: $isShowAddMissonView)
                    }
            }
        }
        .padding(.horizontal, 27)
    }
}

struct MissionListContentView: View {
    @Binding var missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            MissionRow(mission: mission)
        }
        .listStyle(.plain)
        .padding()
    }
}

struct MissionRow: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Text(mission.emoji)
                .font(.system(size: 20))
            Text(mission.name)
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
        .listRowBackground(
            ColorPalette.beige.rgb()
                .cornerRadius(10)
                .padding(10)
        )
        .listRowSeparator(.hidden)
        .padding(.vertical, 25)
        .padding(.horizontal, 10)
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
