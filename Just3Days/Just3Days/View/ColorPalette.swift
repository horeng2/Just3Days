//
//  ColorPalette.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/01.
//

import Foundation
import SwiftUI

enum ColorPalette {
    case mainOrange
    case orange
    case beige
    case lightBeige
    case lightGray
    case gray
    
    func rgb() -> Color {
        switch self {
        case .mainOrange:
            return Color(red: 255/255, green: 153/255, blue: 0/255)
        case .orange:
            return Color(red: 255/255, green: 197/255, blue: 109/255)
        case .beige:
            return Color(red: 255/255, green: 247/255, blue: 218/255)
        case .lightBeige:
            return Color(red: 255/255, green: 253/255, blue: 244/255)
        case .lightGray:
            return Color(red: 218/255, green: 218/255, blue: 218/255)
        case .gray:
            return Color(red: 119/255, green: 119/255, blue: 119/255)
        }
    }
}
