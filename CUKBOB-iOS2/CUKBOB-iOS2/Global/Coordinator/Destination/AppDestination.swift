//
//  AppDestination.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

enum AppDestination: Hashable {
    case myPage
    case editProfile
    case withdraw
    case privacyPolicy
}

extension AppDestination {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .myPage:
            MyPageView()
            
        case .editProfile:
            EditProfileView()
            
        case .withdraw:
            WithdrawView()
            
        case .privacyPolicy:
            privacyPolicyView()
        }
    }
}
