//
//  TodaysMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/02.
//

import Foundation
import SwiftUI

struct TodaysMissionView: View {
    @Binding var index: Int
    @EnvironmentObject var missionLogViewModel: MissionLogViewModel
    @State var isChecked = false
    
    var body: some View {
        if let todayMission = missionLogViewModel.fetchTodayMission(today: Date()) {
            VStack {
                headerView()
                missionTitleView(of: todayMission)
                missionStatusImageView()
                missionStatusTextView()
                firstButtonView(of: todayMission)
                secondButtonView(of: todayMission)
            }
            .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            .background(ColorPalette.beige.rgb())
        } else {
            Text("미션을 뽑아주세요.")
        }
    }
}

extension TodaysMissionView {
    func headerView() -> some View {
        return Text("오늘의 미션")
            .font(.system(size: 32))
            .fontWeight(.bold)
    }
    
    func missionTitleView(of mission: Mission) -> some View {
        return Text(mission.title)
            .font(.system(size: 25))
            .padding(.top, 40)
    }
    
    func missionStatusImageView() -> some View {
        return Image(MissionStatus.imageName.text(isChecked: isChecked))
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .padding(.top)
    }
    
    func missionStatusTextView() -> some View {
        return Text(MissionStatus.discription.text(isChecked: isChecked))
            .font(.system(size: 30))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(ColorPalette.mainOrange.rgb())
            .padding(.top, 40)
    }
    
    func firstButtonView(of mission: Mission) -> some View {
        Button {
            //나의 업적 감상하기
            if isChecked {
                self.index = ViewIndex.MissionLogView.index
            // 미션 완료
            } else {
                isChecked = true
                missionLogViewModel.updateMissionStatus(mission, isSuccess: true)
            }
        } label: {
            Text(MissionStatus.firstButtonTitle.text(isChecked: isChecked))
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(width: 320, height: 50, alignment: .center)
                .foregroundColor(Color.black)
                .background(ColorPalette.lightBeige.rgb())
                .cornerRadius(20)
        }
        .padding(.top, 40)
    }
    
    func secondButtonView(of mission: Mission) -> some View {
        Button {
            //만천하에 알리기
            if isChecked {
                print("만천하에 알리기")
            //오늘은 안할래요
            } else {
                isChecked = true
                missionLogViewModel.updateMissionStatus(mission, isSuccess: false)
            }
        } label: {
            Text(MissionStatus.secondButtonTitle.text(isChecked: isChecked))
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(width: 320, height: 50, alignment: .center)
                .foregroundColor(Color.black)
                .background(ColorPalette.lightBeige.rgb())
                .cornerRadius(20)
        }
        .padding(.top, 10)
    }
}
