//
//  AddMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct EditMissionView: View {
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @Binding var isEditMissionView: Bool
    @State var isModifyMode: Bool
    @State var mission = Mission(title: "")
    
    var body: some View {
        VStack {
            EditMissionTitleView(
                isModifyMode: $isModifyMode,
                mission: $mission
            )
            EditMissionPossibleDayView(
                isModifyMode: $isModifyMode,
                mission: $mission
            )
            Spacer()
            ExitButtonsView(
                isEditMissionView: $isEditMissionView,
                mission: $mission
            )
        }
    }
}

struct EditMissionTitleView: View {
    @Binding var isModifyMode: Bool
    @Binding var mission: Mission
    
    var body: some View {
        TextField(mission.title, text: $mission.title)
            .placeholder(when: mission.title.isEmpty, alignment: .center) {
                Text("미션명을 입력해주세요")
                    .font(.system(size: 30))
                    .multilineTextAlignment(.center)
                    .foregroundColor(ColorPalette.lightGray.rgb())
            }
            .font(.system(size: 30))
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
            .padding(.top, 40)
    }
}

struct EditMissionPossibleDayView: View {
    @Binding var isModifyMode: Bool
    @Binding var mission: Mission
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("언제 할 수 있나요?")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding(.top)
                .padding()
            
            ForEach(MissionPossibleDay.allCases, id: \.self) { possibleDayOption in
                Button {
                    mission.possibleDay = possibleDayOption
                } label: {
                    HStack {
                        Image(systemName: mission.possibleDay == possibleDayOption ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(ColorPalette.mainOrange.rgb())
                    }
                    Text(possibleDayOption.message())
                        .foregroundColor(.black)
                }
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
                .padding()
            }
        }
        .listStyle(.plain)
        .padding(.leading, 30)
    }
}

struct ExitButtonsView: View {
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @Binding var isEditMissionView: Bool
    @Binding var mission: Mission
    
    var body: some View {
        HStack {
            Button {
                isEditMissionView = false
            } label: {
                Text("취소")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 130, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.beige.rgb())
                    .cornerRadius(20)
            }
            .padding(.trailing, 30)
            
            Button {
                isEditMissionView = false
                missionPresetViewModel.create(mission)
            } label: {
                Text("저장")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 130, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.beige.rgb())
                    .cornerRadius(20)
            }
        }
        .padding(.bottom, 30)
    }
}
