//
//  AddMissionView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct AddMissionView: View {
    @State var missionName = "미션명을 입력주세요."
    @State var possibleDay = MissionPossibleDay.weekday
    
    var body: some View {
        VStack {
            TextField(missionName, text: $missionName)
                .font(.system(size: 32))
                .multilineTextAlignment(.center)
            PossibleDayCheckView(checked: true)
            ExitButtonsView()
        }
        .padding(.top, 40)
    }
}

struct PossibleDayCheckView: View {
    var checked: Bool
    var body: some View {
        Text("언제 할 수 있나요?")
            .font(.system(size: 20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 40)
            .padding(.leading, 40)
        List {
            ForEach(MissionPossibleDay.allCases, id: \.self) { possibleDay in
                HStack {
                    Button(action: {print("체크 클릭")}) {
                        Image(systemName: checked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(ColorPalette.mainOrange.rgb())
                    }

                    Text(possibleDay.message())
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .padding(.horizontal)
        

    }
}

struct ExitButtonsView: View {
    var body: some View {
        HStack {
            Button(action: {print("취소 클릭")}) {
                Text("취소")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 130, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.beige.rgb())
                    .cornerRadius(20)
            }
            .padding(.trailing, 30)
            Button(action: {print("저장 클릭")}) {
                Text("저장")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 130, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.beige.rgb())
                    .cornerRadius(20)
            }
        }
        .padding(.bottom, 30)
    }
}

struct AddMissionView_Previews: PreviewProvider {
    static var previews: some View {
        AddMissionView()
    }
}
