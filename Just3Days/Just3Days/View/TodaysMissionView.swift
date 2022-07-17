//
//  TodaysMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/02.
//

import Foundation
import SwiftUI

struct TodaysMissionView: View {
    @StateObject var missionLogViewModel = MissionLogViewModel()
    
    var body: some View {
        let todayMission = missionLogViewModel.fetchTodayMission(today: Date())
        
        VStack {
            headerView()
            missionTitleView(of: todayMission)
            missionStatusImageView(MissionStatus.imageName.text(isChecked: todayMission.isChecked))
            missionStatusTextView(MissionStatus.discription.text(isChecked: todayMission.isChecked))
            firstButtonView(of: todayMission)
            secondButtonView(of: todayMission)
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(ColorPalette.beige.rgb())
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
    
    func missionStatusImageView(_ imageName: String) -> some View {
        return Image(imageName)
            .resizable()
            .frame(width: 150, height: 150, alignment: .center)
            .padding(.top)
    }
    
    func missionStatusTextView(_ discription: String) -> some View {
        return Text(discription)
            .font(.system(size: 30))
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(ColorPalette.mainOrange.rgb())
            .padding(.top, 40)
    }
    
    func firstButtonView(of mission: Mission) -> some View {
        Button {
            if mission.isChecked {
                print("나의 업적 감상하기")
            } else {
                missionLogViewModel.updateMissionStatus(mission, isSuccess: true)
            }
        } label: {
            Text(MissionStatus.firstButtonTitle.text(isChecked: mission.isChecked))
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
            if mission.isChecked {
                print("만천하에 알리기")
            } else {
                missionLogViewModel.updateMissionStatus(mission, isSuccess: false)
            }
        } label: {
            Text(MissionStatus.secondButtonTitle.text(isChecked: mission.isChecked))
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

struct TodaysMissionView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysMissionView()
    }
}
