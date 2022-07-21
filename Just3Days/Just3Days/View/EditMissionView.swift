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
    @State var emptyValue = false
    
    var body: some View {
        VStack {
            titleView()
            pickPossibleDayView()
            Spacer()
            exitButtonsView()
        }
    }
}

extension EditMissionView {
    func titleView() -> some View {
        return TextField(mission.title, text: $mission.title)
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
    
    func pickPossibleDayView() -> some View {
        return VStack(alignment: .leading) {
            Text("언제 할 수 있나요?")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.black)
                .padding(.top)
                .padding()
            possibleDaysView()
        }
        .listStyle(.plain)
        .padding(.leading, 30)
    }
    
    func possibleDaysView() -> some View {
        return ForEach(MissionPossibleDay.allCases, id: \.self) { possibleDayOption in
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
    
    func exitButtonsView() -> some View {
        return HStack {
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
                if mission.title.isEmpty || mission.possibleDay == nil {
                    emptyValue = true
                } else {
                    isEditMissionView = false
                    missionPresetViewModel.save(mission, isModifyMode: isModifyMode)
                }
            } label: {
                Text("저장")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 130, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.beige.rgb())
                    .cornerRadius(20)
            }
            .alert(Text("모든 값을 입력해주세요."), isPresented: $emptyValue, actions: {})
        }
        .padding(.bottom, 30)
    }
}
