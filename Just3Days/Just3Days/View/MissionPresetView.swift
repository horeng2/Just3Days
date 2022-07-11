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
    @State var isShowEditMissonView  = false
    @State var isShowModifyMissonView  = false
    
    var body: some View {
        VStack {
            headerView()
            content
        }
    }
    
    @ViewBuilder var content: some View {
        if missionPresetViewModel.fetch().isEmpty {
            Spacer()
            Text("미션을 등록해주세요!")
            Spacer()
        } else {
            missionPresetListView()
        }
    }
}

// MARK: - Displaying Content
extension MissionPresetView {
    func headerView() -> some View {
        HStack(alignment: .center) {
            Text("리스트")
                .font(.system(size: 32))
                .fontWeight(.bold)
            Spacer()
            Button {
                isShowEditMissonView = true
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 22, height: 22, alignment: .center)
                    .fullScreenCover(isPresented: $isShowEditMissonView) {
                        EditMissionView(isEditMissionView: $isShowEditMissonView, isModifyMode: false)
                    }
                    .foregroundColor(ColorPalette.mainOrange.rgb())
                    .padding(.bottom, 5)
            }
        }
        .padding(27)
    }
    
    func missionPresetRowView(mission: Mission) -> some View {
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
        .onTapGesture {
            isShowModifyMissonView = true
        }
        .fullScreenCover(isPresented: $isShowModifyMissonView) {
            EditMissionView(isEditMissionView: $isShowModifyMissonView, isModifyMode: true, mission: mission)
        }
    }
}

//MARK: - Loading Content
extension MissionPresetView {
    func missionPresetListView() -> some View {
        List {
            let missionPreset = missionPresetViewModel.fetch()
            ForEach(missionPreset) { mission in
                missionPresetRowView(mission: mission)
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


struct MissionPresetView_Previews: PreviewProvider {
    static var previews: some View {
        MissionPresetView()
    }
}
