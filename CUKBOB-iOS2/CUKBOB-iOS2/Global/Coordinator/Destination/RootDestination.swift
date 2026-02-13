//
//  RootDestination.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

enum RootDestination: Hashable {
    case splash
    case auth
    case onboarding
    case weeklyMenu
}

extension RootDestination {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .splash:
            SplashView()
        case .auth:
            Text("auth")
        case .onboarding:
            Text("onboarding")
        case .weeklyMenu:
            WeeklyMenuView()
        }
    }
}
