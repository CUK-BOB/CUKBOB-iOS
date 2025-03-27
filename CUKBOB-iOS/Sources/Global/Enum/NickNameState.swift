//
//  NickNameState.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

enum NickNameState {
    case count
    case duplicate
    case available
    case unavailableCount
    case alradyExist
    
    var text: String {
        switch self {
        case .count:
            return "2~5글자 내로 입력해주세요 (특수문자X)"
        case .duplicate:
            return "중복 확인을 해주세요"
        case .available:
            return "사용 가능한 닉네임입니다"
        case .unavailableCount:
            return "2~5글자 내로 입력해주세요 (특수문자X)"
        case .alradyExist:
            return "이미 사용된 닉네임입니다"
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .count:
            return .checkNone
        case .duplicate:
            return .checkNone
        case .available:
            return .checkSuccess
        case .unavailableCount:
            return .checkError
        case .alradyExist:
            return .checkError
        }
    }
    
    var color: Color {
        switch self {
        case .count:
            return Color(.gray400)
        case .duplicate:
            return Color(.gray400)
        case .available:
            return Color(.success)
        case .unavailableCount:
            return Color(.error)
        case .alradyExist:
            return Color(.error)
        }
    }
}
