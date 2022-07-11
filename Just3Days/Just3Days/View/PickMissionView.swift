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
    @State var currentMissionSet: [DayOfMission: Mission]
    @State var chance = 5
    
    var body: some View {
        VStack(spacing: 20) {
            PickMissionHeaderView(chance: $chance)
            ThreeDaysMissionView(currentMissionSet: $currentMissionSet)
            pickMissionButtonView(missionLogViewModel: missionLogViewModel, currentMissionSet: $currentMissionSet, chance: $chance)
        }
        .background(ColorPalette.beige.rgb())
    }
}

struct PickMissionHeaderView: View {
    @Binding var chance: Int

    var body: some View {
        if chance > 0 {
            Text("미 션  뽑 기")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.top, 40)
        } else {
            Text("미 션 목 록")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.top, 40)
        }
    }
}

struct ThreeDaysMissionView: View {
    @Binding var currentMissionSet: [DayOfMission: Mission]
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(ColorPalette.lightGray.rgb(), lineWidth: 3)
                .background(ColorPalette.lightBeige.rgb())
                .cornerRadius(20)
                .padding(.horizontal, 40)
            VStack(spacing: 20) {
                ForEach(DayOfMission.allCases, id: \.self) { day in
                    dailyMissionView(day: day.discription, mission: currentMissionSet[day]?.title ?? "")
                }
            }
        }
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
}

struct dailyMissionView: View {
    let day: String
    let mission: String
    var body: some View {
        Text(day)
            .font(.system(size: 22))
            .fontWeight(.bold)
        Text(mission)
            .font(.system(size: 18))
    }
}

struct pickMissionButtonView: View {
    @EnvironmentObject var missionPresetViewModel: MissionPresetViewModel
    @ObservedObject var missionLogViewModel: MissionLogViewModel
    @Binding var currentMissionSet: [DayOfMission: Mission]
    @Binding var chance: Int
    @State var tapButtonAlert = false
    @State var noChanceAlert = false
    
    var body: some View {
        Button {
            tapButtonAlert = true
            if chance > .zero {
                currentMissionSet = pickRandomElement(missionPresetViewModel.fetch())
                chance -= 1
            } else {
                noChanceAlert = true
            }
        } label: {
            if chance > .zero {
                Image("pickButton")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(.top)
            }
        }
        .alert(isPresented: $tapButtonAlert) {
            if noChanceAlert {
                let button = Alert.Button.default(Text("이대로 결정")) {
                    missionLogViewModel.saveMissionSet(currentMissionSet)
                }
                return Alert(title: Text("다시 뽑기 기회를 다 썼어요!"), message: nil, dismissButton: button)
            } else {
                let firstButton = Alert.Button.cancel(Text("다시 뽑기"))
                let secondButton = Alert.Button.default(Text("결정")) {
                    chance = .zero
                    missionLogViewModel.saveMissionSet(currentMissionSet)
                }
                return Alert(title: Text("뽑기 결과"),
                             message: Text("""
                                \(currentMissionSet[.firstDay]?.title ?? "")
                                \(currentMissionSet[.secondDay]?.title ?? "")
                                \(currentMissionSet[.thirdDay]?.title ?? "")
                                """)
                             , primaryButton: firstButton, secondaryButton: secondButton)
            }
        }
        if chance > .zero {
            Text("남은 기회: \(chance)회")
                .font(.system(size: 20))
                .padding(.bottom, 40)
        }
    }
}

extension pickMissionButtonView {
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

