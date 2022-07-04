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
        let currentStatus = MissionStatus(isSuccess)
        VStack {
            Text("오늘의 미션")
                .font(.system(size: 32))
                .fontWeight(.bold)
            
            Text("미션내용")
                .font(.system(size: 25))
                .padding(.top, 40)
            
            Image(currentStatus.imageName)
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.top)
            
            Text(currentStatus.discription)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(ColorPalette.mainOrange.rgb())
                .padding(.top, 40)
            
            Button(action: {print("firstButton 클릭")}) {
                Text(currentStatus.firstButtonTitle)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 320, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.lightBeige.rgb())
                    .cornerRadius(20)
            }
            .padding(.top, 40)
            
            Button(action: {print("안할래요 클릭")}) {
                Text(currentStatus.secondButtonTitle)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .frame(width: 320, height: 50, alignment: .center)
                    .foregroundColor(Color.black)
                    .background(ColorPalette.lightBeige.rgb())
                    .cornerRadius(20)
            }
            .padding(.top, 10)
        }
        .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        .background(ColorPalette.beige.rgb())
    }
}

struct TodaysMissionView_Previews: PreviewProvider {
    static var previews: some View {
        TodaysMissionView(isSuccess: true)
    }
}
