//
//  TextFieldDescriptionType.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

enum TextFieldDescriptionType {
    case none
    case duplicated
    case invailedFormat
    case withdrawalWarning
    
    var description: String {
        switch self {
        case .none:
            return ""
        case .duplicated:
            return "이미 사용중인 닉네임이에요"
        case .invailedFormat:
            return "2~5글자 내로 입력해주세요 ( 특수문자 불가 )"
        case .withdrawalWarning:
            return "작성한 데이터는 모두 사라집니다.\n삭제된 내용은 복구할 수 없으니, 신중하게 결정해 주세요."
        }
    }
    
    var color: Color {
        switch self {
        case .none, .withdrawalWarning:
            return .blue200
        case .duplicated, .invailedFormat:
            return .red100
        }
    }
}
