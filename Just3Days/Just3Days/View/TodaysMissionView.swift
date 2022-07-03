//
//  TodaysMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/02.
//

import Foundation
import SwiftUI

struct TodaysMissionView: View {
    let isSuccess: Bool
    var body: some View {
        VStack {
            Text("오늘의 미션")
                .font(.system(size: 32))
                .fontWeight(.bold)
            Text("미션내용")
                .font(.system(size: 25))
                .padding(.top, 40)
            if isSuccess {
                MissionSuccessView()
            } else {
                MissionProgressView()
            }
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(ColorPalette.beige.rgb())
    }
}

struct MissionSuccessView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("TodaysMission")
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.top)
            Text("곧 해치울 미션입니다.")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.mainOrange.rgb())
                .padding(.top, 40)
            
            Button(action: {print("해냈어요 클릭")}) {
                Text("해냈어요!")
                    .frame(width: 300, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.lightBeige.rgb())
                    .cornerRadius(20)
            }
            .padding(.top, 40)
            Button(action: {print("안할래요 클릭")}) {
                Text("오늘은 그럴 일이 있어서 안할래요!!")
                    .frame(width: 300, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.lightBeige.rgb())
                    .cornerRadius(20)
            }
        }
    }
}

struct MissionProgressView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("MissionSuccess")
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.top)
            Text("""
                오늘도
                내 가 해 냈 다!
                """)
            Button(action: {print("나의 업적 감상하기 클릭")}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .background(ColorPalette.lightBeige.rgb())
                        .padding(.top, 30)
                        .padding(.horizontal, 40)
                    Text("나의 업적 감상하기")
                }
            }
            Button(action: {print("알리기 클릭")}) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .background(ColorPalette.lightBeige.rgb())
                        .padding(.top, 30)
                        .padding(.horizontal, 40)
                    Text("만천하에 알리기")
                }
            }
        }
    }
}


