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
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func onDidAppear(perform: @escaping () -> Void) -> some View {
        background(ViewDidAppearModifier(onDidAppear: perform))
    }
}
