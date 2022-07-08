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
    @Binding var isAddMissionView: Bool
    @State var mission = Mission(emoji: "", name: "", possibleDay: .allWeek)
    @State var pickedStatus: [MissionPossibleDay: Bool] = makeInitialPickStatus()

    var body: some View {
        VStack {
            EditMissionTitleView(mission: $mission)
            EditMissionPossibleDayView(pickedStatus: $pickedStatus)
            Spacer()
            ExitButtonsView(isAddMissionView: $isAddMissionView,
                            mission: $mission,
                            pickedStatus: $pickedStatus)
        }
    }
}

struct EditMissionTitleView: View {
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
    @Binding var pickedStatus: [MissionPossibleDay: Bool]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("언제 할 수 있나요?")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding(.top)
                .padding()
            
            ForEach(MissionPossibleDay.allCases, id: \.self) { possibleDay in
                Button {
                    let duplicatePick = pickedStatus.map{ $0.value }.contains(true)
                    if duplicatePick {
                        pickedStatus.forEach { day in
                            pickedStatus[day.key] = false
                        }
                    }
                    pickedStatus[possibleDay]?.toggle()
                } label: {
                    HStack {
                        Image(systemName: pickedStatus[possibleDay] ?? false ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(ColorPalette.mainOrange.rgb())
                    }
                    Text(possibleDay.message())
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
    @Binding var isAddMissionView: Bool
    @Binding var mission: Mission
    @Binding var pickedStatus: [MissionPossibleDay: Bool]
    
    var body: some View {
        HStack {
            Button {
                isAddMissionView = false
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
                isAddMissionView = false
                let pickedDay = pickedStatus.filter{ $0.value == true }.map{ $0.key }.first ?? .allWeek
                mission.possibleDay = pickedDay
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

func makeInitialPickStatus() -> [MissionPossibleDay: Bool] {
    var pickedDayList = [MissionPossibleDay: Bool]()
    MissionPossibleDay.allCases.forEach { possibleDay in
        pickedDayList[possibleDay] = false
    }
    pickedDayList[.allWeek] = true
    return pickedDayList
}
