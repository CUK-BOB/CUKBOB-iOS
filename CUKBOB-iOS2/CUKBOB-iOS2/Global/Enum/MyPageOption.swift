//
//  MyPageOption.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

enum MyPageOption: CaseIterable {
    case editProfile
    case logout
    case withdraw
    case privacyPolicy
    
    var title: String {
        switch self {
        case .editProfile: return "프로필 수정"
        case .logout: return "로그아웃"
        case .withdraw: return "회원탈퇴"
        case .privacyPolicy: return "개인 정보 처리방침"
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .editProfile: return .fiRrPortrait
        case .logout: return .fiRrUnlock
        case .withdraw: return .fiRrUserDelete
        case .privacyPolicy: return .fiRrDocumentSigned
        }
    }
}
