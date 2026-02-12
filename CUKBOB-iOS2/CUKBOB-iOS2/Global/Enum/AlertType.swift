//
//  AlertType.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import Foundation

enum AlertType {
    case logout
    case withdraw
    
    var title: String {
        switch self {
        case .logout: return "로그아웃"
        case .withdraw: return "회원탈퇴"
        }
    }
    
    var message: String {
        switch self {
        case .logout: return "CUK_BOB\n로그아웃 하시겠습니까?"
        case .withdraw: return "CUK_BOB\n회원탈퇴 하시겠습니까?"
        }
    }
    
    var confirmText: String {
        switch self {
        case .logout: return "로그아웃"
        case .withdraw: return "확인"
        }
    }
    
    var cancelText: String {
        switch self {
        default: return "취소"
        }
    }
}
