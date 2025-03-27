//
//  View+.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared
            .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
