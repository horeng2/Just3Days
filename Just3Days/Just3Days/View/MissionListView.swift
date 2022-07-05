//
//  MissionListView.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation
import SwiftUI

struct MissionListView: View {
    let missions = [
        Mission(emoji: "🌤", name: "이불정리하기", possibleDay: .allWeek),
        Mission(emoji: "🧗‍♀️", name: "운동하기", possibleDay: .weekend)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("리스트")
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                Spacer()
                Button(action: {print("+클릭")}) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
            }
            .padding(.horizontal, 27)
            
            List(missions) { mission in
                MissionRow(mission: mission)
            }
            .listStyle(.plain)
            .padding()
        }
        .padding(.top)
    }
}

struct MissionRow: View {
    let mission: Mission
    
    var body: some View {
        HStack {
            Text(mission.emoji)
                .font(.system(size: 20))
            Text(mission.name)
                .font(.system(size: 20))
                .fontWeight(.bold)
        }
        .listRowSeparator(.hidden)
        .listRowBackground(
            ColorPalette.beige.rgb()
                .cornerRadius(10)
                .padding(10)
        )
        .padding(.vertical, 25)
        .padding(.horizontal, 10)
    }
}

struct MissionListView_Previews: PreviewProvider {
    static var previews: some View {
        MissionListView()
    }
}
