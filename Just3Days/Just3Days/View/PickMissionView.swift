//
//  PickMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/01.
//

import Foundation
import SwiftUI

struct PickMissionView: View {
    @StateObject var missionLogViewModel = MissionLogViewModel()
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @State var chance = 5
    @State var isTapPickButton = false
    @State var missionPresetIsEmpty = false
    @State var pickedMissions: [DayOfMission: Mission]
    @Binding var index: Int
    
    var body: some View {
        content
            .background(ColorPalette.beige.rgb())
    }
    
    @ViewBuilder
    var content: some View {
        VStack {
            if chance > .zero {
                headerView(title: "미 션 뽑 기")
                threeDaysMissionView()
                pickMissionButtonView()
                remainigCountView()
            } else {
                headerView(title: "미 션 목 록")
                threeDaysMissionView()
            }
        }
    }
}

// MARK: - Displaying Content
extension PickMissionView {
    func headerView(title: String) -> some View {
        return Text(title)
            .font(.system(size: 32))
            .fontWeight(.bold)
            .padding(.top, 40)
    }
    
    func threeDaysMissionView() -> some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(ColorPalette.lightGray.rgb(), lineWidth: 3)
                .background(ColorPalette.lightBeige.rgb())
                .cornerRadius(20)
                .padding(.horizontal, 40)
            VStack(spacing: 20) {
                ForEach(DayOfMission.allCases, id: \.self) { day in
                    dailyMissionView(of: day)
                }
            }
        }
        .alert(isPresented: $isTapPickButton) {
            alertOfpickResult()
        }
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
    
    func pickMissionButtonView() -> some View {
        return Button {
            let missionPreset = missionPresetViewModel.fetch()
            if missionPreset.isEmpty {
                missionPresetIsEmpty = true
            } else {
                isTapPickButton = true
                pickedMissions = pickRandomElement(missionPreset)
                chance -= 1
            }
        } label: {
            Image("pickButton")
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.top)
        }
        .alert(isPresented: $missionPresetIsEmpty) {
            alertEmptyPreset()
        }
    }
    
    func remainigCountView() -> some View {
        return Text("남은 기회: \(chance)회")
            .font(.system(size: 20))
            .padding(.bottom, 40)
    }
    
    func alertEmptyPreset() -> Alert {
        let cancelButton = Alert.Button.cancel(Text("취소"))
        let moveButton = Alert.Button.default(Text("등록")) {
            self.index = 2
        }
        return Alert(title: Text("등록된 미션이 없어요!"), primaryButton: cancelButton, secondaryButton: moveButton)
    }
}

//MARK: - Loading Content
extension PickMissionView {
    func dailyMissionView(of day: DayOfMission) -> some View {
        return VStack {
            Text(day.discription)
                .font(.system(size: 22))
                .fontWeight(.bold)
            Text(pickedMissions[day]?.title ?? "")
                .font(.system(size: 18))
        }
    }
    
    func alertOfpickResult() -> Alert {
        if chance == .zero {
            let button = Alert.Button.default(Text("이대로 결정")) {
                missionLogViewModel.saveMissionSet(pickedMissions)
            }
            return Alert(title: Text("다시 뽑기 기회를 다 썼어요!"), message: nil, dismissButton: button)
        } else {
            let firstButton = Alert.Button.cancel(Text("다시 뽑기"))
            let secondButton = Alert.Button.default(Text("결정")) {
                chance = .zero
                missionLogViewModel.saveMissionSet(pickedMissions)
            }
            return Alert(title: Text("뽑기 결과"),
                         message: Text("""
                                \(pickedMissions[.firstDay]?.title ?? "")
                                \(pickedMissions[.secondDay]?.title ?? "")
                                \(pickedMissions[.thirdDay]?.title ?? "")
                                """)
                         , primaryButton: firstButton, secondaryButton: secondButton)
        }
    }
}

extension PickMissionView {
    func pickRandomElement(_ mission: [Mission]) -> [DayOfMission: Mission] {
        var shuffledMissions = mission.shuffled()
        var randomMissionSet = [DayOfMission: Mission]()
        
        DayOfMission.allCases.forEach { day in
            randomMissionSet[day] = shuffledMissions.last
            shuffledMissions.removeLast()
        }
        
        return randomMissionSet
    }
}

