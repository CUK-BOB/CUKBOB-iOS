//
//  WeekDay.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import Foundation

enum Weekday: Int, CaseIterable {
    case sun = 0
    case mon
    case tue
    case wed
    case thu
    case fri
    case sat
    
    var koreanSymbol: String {
        switch self {
        case .sun:
            return "일"
        case .mon:
            return "월"
        case .tue:
            return "화"
        case .wed:
            return "수"
        case .thu:
            return "목"
        case .fri:
            return "금"
        case .sat:
            return "토"
        }
    }
}
