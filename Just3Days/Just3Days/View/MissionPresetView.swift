//
//  MissionListView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct MissionPresetView: View {
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @State var isShowAddMissonView  = false

    
    var body: some View {
        let missionPreset = missionPresetViewModel.fetch()
        VStack {
            MissionPresetHeaderView(isShowAddMissonView: $isShowAddMissonView)
            MissionPresetContentView(missionPreset: missionPreset)
        }
    }
}

struct MissionPresetHeaderView: View {
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
                        EditMissionView(isAddMissionView: $isShowAddMissonView)
                    }
                    .foregroundColor(ColorPalette.mainOrange.rgb())
                    .padding(.bottom, 5)
            }
        }
        .padding(27)
    }
}

struct MissionPresetContentView: View {
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    let missionPreset: [Mission]
    
    var body: some View {
        List {
            ForEach(missionPreset) { mission in
                MissionRowView(mission: mission)
            }
            .onDelete { indexSet in
                let index = indexSet[indexSet.startIndex]
                let mission = missionPreset[index]
                missionPresetViewModel.delete(mission)
            }
        }
        .listStyle(.plain)
    }

}

struct MissionRowView: View {
    let mission: Mission
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(ColorPalette.beige.rgb())
            HStack {
                Text(mission.emoji)
                    .font(.system(size: 20))
                Text(mission.title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            .padding()
        }
        .listRowSeparator(.hidden)
    }
}

struct MissionPresetView_Previews: PreviewProvider {
    static var previews: some View {
        MissionPresetView()
    }
}
