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
    
    var body: some View {
        Button {
            if chance > 0 {
                randomMissionSet = pickRandomElement(missionPresetViewModel.fetch())
                chance -= 1
            } else {
                print("기회가 없어용")    //alert 구현 예정
            }
        } label: {
            Image("pickButton")
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.top)
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
