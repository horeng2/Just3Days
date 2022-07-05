//
//  AddMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct AddMissionView: View {
    @Binding var isAddMissionView: Bool
    
    var body: some View {
        VStack {
            AddMissionHeaderView()
            AddMissionDayView()
            Spacer()
            AddMissionExitButtonsView(isAddMissionView: $isAddMissionView)
        }
    }
}

struct AddMissionHeaderView: View {
    @State var missionName = ""
    
    var body: some View {
        TextField(missionName, text: $missionName)
            .placeholder(when: missionName.isEmpty, alignment: .center) {
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

struct AddMissionDayView: View {
    @State var pickStatus = makeInitialPickStatus()

    var body: some View {
        VStack(alignment: .leading) {
            Text("언제 할 수 있나요?")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding(.top)
                .padding()
            PickDayListView(pickStatus: $pickStatus)
        }
        .listStyle(.plain)
        .padding(.leading, 30)
    }
}

struct PickDayListView: View {
    @Binding var pickStatus: [MissionPossibleDay: Bool]

    var body: some View {
        ForEach(MissionPossibleDay.allCases, id: \.self) { possibleDay in
            Button {
                let duplicatePick = pickStatus.map{ $0.value }.contains(true)
                if duplicatePick {
                    pickStatus.forEach { day in
                        pickStatus[day.key] = false
                    }
                }
                pickStatus[possibleDay]?.toggle()
            } label: {
                HStack {
                    Image(systemName: pickStatus[possibleDay] ?? false ? "checkmark.circle.fill" : "circle")
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
}

struct AddMissionExitButtonsView: View {
    @Binding var isAddMissionView: Bool
    
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
