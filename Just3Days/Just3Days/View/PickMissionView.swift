//
//  PickMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/01.
//

import Foundation
import SwiftUI

struct PickMissionView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("미 션  뽑 기")
                .font(.system(size: 32))
                .fontWeight(.bold)
                .padding(.top, 40)
            ThreeDaysMissionView()
                .padding(.top, 20)
            Button(action: {print("버튼클릭")}) {
                Image("pickButton")
                    .resizable()
                    .frame(width: 70, height: 70, alignment: .center)
                    .padding(.top)
            }
            Text("남은 기회: 5회")
                .font(.system(size: 20))
                .padding(.bottom, 40)
        }
        .background(ColorPalette.beige.rgb())
    }
}

struct ThreeDaysMissionView: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .stroke(ColorPalette.lightGray.rgb(), lineWidth: 3)
                .cornerRadius(20)
                .background(ColorPalette.lightBeige.rgb())
                .padding(.horizontal, 40)
            VStack(spacing: 20) {
                PickedMissionView(day: "시작하는 날", mission: "파란문제 뿌시기")
                PickedMissionView(day: "벌써 반이나 지난 날", mission: "제리 똥치우기")
                PickedMissionView(day: "끝나는 날", mission: "흑마도사 만렙찍기")
            }
        }
    }
}

struct PickedMissionView: View {
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

struct PickMissionView_Previews: PreviewProvider {
    static var previews: some View {
        PickMissionView()
    }
}
