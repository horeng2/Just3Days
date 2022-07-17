//
//  MissionStatus.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/05.
//

import Foundation

enum MissionStatus {
    case imageName
    case discription
    case firstButtonTitle
    case secondButtonTitle
    
    func text(isChecked: Bool) -> String {
        if isChecked {
            switch self {
            case .imageName:
                return "MissionSuccess"
            case .discription:
                return """
                            오 늘 도
                            내 가 해 냈 다!
                            """
            case .firstButtonTitle:
                return "나의 업적 감상하기"
            case .secondButtonTitle:
                return "만천하에 알리기"
            }
        } else {
            switch self {
            case .imageName:
                return "TodaysMission"
            case .discription:
                return """
                            오 늘 도
                            곧 해치울 미션입니다.
                            """
            case .firstButtonTitle:
                return "해냈어요!"
            case .secondButtonTitle:
                return "오늘은 그럴 일이 있어서 안할래요!"
            }
        }
    }
}
