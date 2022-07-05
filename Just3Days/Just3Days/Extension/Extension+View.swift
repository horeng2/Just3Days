//
//  Extension+View.swift
//  Just3Days
//
//  Created by 서녕 on 2022/07/06.
//

import Foundation
import SwiftUI

extension View {
    func placeholder<Content: View>(
        when willShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(willShow ? 1 : 0)
                self
            }
        }
}
