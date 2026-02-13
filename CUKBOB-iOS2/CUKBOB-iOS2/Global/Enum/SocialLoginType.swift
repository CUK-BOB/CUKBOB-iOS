//
//  SocialLoginType.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/13/26.
//

import SwiftUI

enum SocialLoginType: String, Equatable {
    case kakao = "KAKAO"
    case apple = "APPLE"
}

// MARK: - SocialLoginButtonStyle

extension SocialLoginType {
    var buttonIcon: ImageResource {
        switch self {
        case .kakao: return .kakaoTalkIcon
        case .apple: return .appleLogo
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .kakao: return "카카오 로그인"
        case .apple: return "Apple 로그인"
        }
    }
    
    var buttonTitleColor: Color {
        switch self {
        case .kakao: return Color(red: 0.1, green: 0.1, blue: 0.1)
        case .apple: return .white
        }
    }
    
    var buttonBackgroundColor: Color {
        switch self {
        case .kakao: return Color(red: 1, green: 0.9, blue: 0)
        case .apple: return .black
        }
    }
}

