//
//  MissionStatus.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation

struct MissionStatus {
    let isSuccess: Bool
    let imageName: String
    let discription: String
    let firstButtonTitle: String
    let secondButtonTitle: String
    
    init(_ isSuccess: Bool) {
        self.isSuccess = isSuccess
        if isSuccess {
            self .imageName = "MissionSuccess"
            self.discription = """
                            오 늘 도
                            내 가 해 냈 다!
                            """
            self.firstButtonTitle = "나의 업적 감상하기"
            self.secondButtonTitle = "만천하에 알리기"
        } else {
            self .imageName = "TodaysMission"
            self.discription = """
                            오 늘 도
                            곧 해치울 미션입니다.
                            """
            self.firstButtonTitle = "해냈어요!"
            self.secondButtonTitle = "오늘은 그럴 일이 있어서 안할래요!"
        }
    }
}
