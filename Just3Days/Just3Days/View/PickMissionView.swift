//
//  PickMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/01.
//

import Foundation
import SwiftUI

struct PickMissionView: View {
    @State var randomMissionSet: [DayOfMission: Mission] = {
        var missions = [DayOfMission: Mission]()
        DayOfMission.allCases.forEach { day in
            missions[day] = Mission(title: "미션을 뽑아주세요.")
        }
        return missions
    }()
    
    var body: some View {
        VStack(spacing: 20) {
            PickMissionHeaderView()
            ThreeDaysMissionView(randomMissionSet: $randomMissionSet)
            pickMissionButtonView(randomMissionSet: $randomMissionSet)
        }
        .background(ColorPalette.beige.rgb())
    }
}

func pickRandomElement(_ mission: [Mission]) -> [DayOfMission: Mission] {
    var shuffledMissions = mission.shuffled()
    var randomMissionSet = [DayOfMission: Mission]()
    
    DayOfMission.allCases.forEach { day in
        randomMissionSet[day] = shuffledMissions.last
        shuffledMissions.removeLast()
    }
    
    return randomMissionSet
}

struct PickMissionHeaderView: View {
    var body: some View {
        Text("미 션  뽑 기")
            .font(.system(size: 32))
            .fontWeight(.bold)
            .padding(.top, 40)
    }
}

struct ThreeDaysMissionView: View {
    @Binding var randomMissionSet: [DayOfMission: Mission]
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(ColorPalette.lightGray.rgb(), lineWidth: 3)
                .cornerRadius(20)
                .background(ColorPalette.lightBeige.rgb())
                .padding(.horizontal, 40)
            VStack(spacing: 20) {
                ForEach(DayOfMission.allCases, id: \.self) { day in
                    dailyMissionView(day: day.discription, mission: randomMissionSet[day]?.title ?? "")
                }
            }
        }
        .padding(.top, 20)
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
    @Binding var randomMissionSet: [DayOfMission: Mission]
    @State var chance = 5
    @State var showingAlert = false
    @State var noChanceAlert = false
    
    var body: some View {
        Button {
            showingAlert = true
            if chance > 0 {
                randomMissionSet = pickRandomElement(missionPresetViewModel.fetch())
                chance -= 1
            } else {
                noChanceAlert = true
            }
        } label: {
            Image("pickButton")
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.top)
        }
        .alert(isPresented: $showingAlert) {
            if noChanceAlert {
                return Alert(title: Text("기회가 없어요"), message: nil, dismissButton: .default(Text("결정")))
            } else {
                let firstButton = Alert.Button.default(Text("결정")) {
                    print("결정")
                }
                let secondButton = Alert.Button.cancel(Text("다시 뽑기")) {
                    print("다시뽑기")
                }
                return Alert(title: Text("뽑기 결과"),
                             message: Text("""
                                \(randomMissionSet[.firstDay]?.title ?? "")
                                \(randomMissionSet[.secondDay]?.title ?? "")
                                \(randomMissionSet[.thirdDay]?.title ?? "")
                                """)
                             , primaryButton: firstButton, secondaryButton: secondButton)
            }
        }
        
        Text("남은 기회: \(chance)회")
            .font(.system(size: 20))
            .padding(.bottom, 40)
    }
}

struct PickMissionView_Previews: PreviewProvider {
    static var previews: some View {
        PickMissionView()
    }
}
