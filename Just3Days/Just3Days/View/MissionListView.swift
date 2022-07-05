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
        HStack(alignment: .center) {
            Text("리스트")
                .font(.system(size: 32))
                .fontWeight(.bold)
            Spacer()
            Button {
                isShowAddMissonView = true
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .fullScreenCover(isPresented: $isShowAddMissonView) {
                        AddMissionView(isAddMissionView: $isShowAddMissonView)
                    }
                    .foregroundColor(ColorPalette.mainOrange.rgb())
                    .padding(.bottom, 5)
            }
        }
        .padding(27)
    }
}

struct MissionListContentView: View {
    @Binding var missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            MissionRow(mission: mission)
                .swipeActions {
                    Button(role: .destructive) {
                        //데이터 삭제 코드 구현 예정
                    } label: {
                        Image(systemName: "trash")
                    }
                    .tint(ColorPalette.mainOrange.rgb())
                }
        }
        .listStyle(.plain)
    }
}

struct MissionRow: View {
    let mission: Mission
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(ColorPalette.beige.rgb())
            HStack {
                Text(mission.emoji)
                    .font(.system(size: 20))
                Text(mission.name)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            .padding()
        }
        .listRowSeparator(.hidden)
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
