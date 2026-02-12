//
//  View+.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

extension View {
    /// 현재 화면에서 키보드를 내립니다.
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

