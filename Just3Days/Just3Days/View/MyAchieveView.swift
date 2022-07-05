//
//  MyAchieceView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct MyAchieveView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                MyAchiveHeaderView()
                MyAchiveCalendarView()
                AchieveLogView()
            }
        }
    }
}

struct MyAchiveHeaderView: View {
    var body: some View {
        Text("""
            지금까지
            5일이나 성공했어요.
            """)
            .font(.system(size: 27))
            .fontWeight(.bold)
            .foregroundColor(ColorPalette.mainOrange.rgb())
            .multilineTextAlignment(.center)
            .padding(.top, 40)
    }
}

struct MyAchiveCalendarView: View {
    @State var date = Date()

    var body: some View {
        DatePicker("달력", selection: $date, displayedComponents: .date)
            .datePickerStyle(.graphical)
            .accentColor(ColorPalette.mainOrange.rgb())
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(ColorPalette.lightGray.rgb())
                    .background(ColorPalette.lightBeige.rgb())
            )
            .padding(.horizontal, 30)
    }
}

struct AchieveLogView: View {
    var body: some View {
        VStack {
            Text("3일 미션 현황")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .padding(.bottom, 10)
            Text("올클리어")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.mainOrange.rgb())
            Text("3회")
                .padding(.bottom, 5)
            Text("어쨌든클리어")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.orange.rgb())
            Text("2회")
                .padding(.bottom, 5)
            Text("미션실패")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(ColorPalette.gray.rgb())
            Text("""
                그런 적이 있나요? 기억이 안나요.
                하지만 정말 궁금하시다면...
                """)
                .fixedSize()
                .multilineTextAlignment(.center)
                .foregroundColor(Color.gray)
            Button(action: {print("눈알클릭")}) {
                Text("👀")
                    .font(.system(size: 20))
                    .frame(width: 40, height: 40)
                    .background(ColorPalette.beige.rgb())
                    .cornerRadius(25)
            }
            .padding(.bottom, 30)
        }
        .padding(.top)
    }
}

struct MyAchieveView_Previews: PreviewProvider {
    static var previews: some View {
        MyAchieveView()
    }
}
