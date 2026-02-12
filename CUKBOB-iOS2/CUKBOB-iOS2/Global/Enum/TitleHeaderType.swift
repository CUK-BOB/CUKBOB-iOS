//
//  TitleHeaderType.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import Foundation

enum TitleHeaderType {
    case nickname
    case withdraw
    
    var title: String {
        switch self {
        case .nickname:
            return "닉네임을 입력해주세요"
        case .withdraw:
            return "탈퇴하실 건가요?"
        }
    }
    
    var subtitle: String {
        switch self {
        case .nickname:
            return "2~5글자 내로 입력해주세요 (특수문자 불가)"
        case .withdraw:
            return "탈퇴를 원하시면, ‘회원탈퇴'를 입력하세요"
        }
    }
}
