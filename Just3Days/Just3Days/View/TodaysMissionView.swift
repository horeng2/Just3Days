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
            missionTitleView()
            missionStatusImageView(MissionStatus.imageName.text(isSuccess: todayMission.isSuccess))
            missionStatusTextView(MissionStatus.discription.text(isSuccess: todayMission.isSuccess))
            firstButtonView(title: MissionStatus.firstButtonTitle.text(isSuccess: todayMission.isSuccess))
            secondButtonView(title: MissionStatus.secondButtonTitle.text(isSuccess: todayMission.isSuccess))
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
     
    func missionTitleView() -> some View {
        return Text("미션내용")
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
    
    func firstButtonView(title: String) -> some View {
        Button(action: {print("firstButton 클릭")}) {
            Text(title)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .frame(width: 320, height: 50, alignment: .center)
                .foregroundColor(Color.black)
                .background(ColorPalette.lightBeige.rgb())
                .cornerRadius(20)
        }
        .padding(.top, 40)
    }
    
    func secondButtonView(title: String) -> some View {
        Button(action: {print("안할래요 클릭")}) {
            Text(title)
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
