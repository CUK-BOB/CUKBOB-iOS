//
//  MealTime.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/28/25.
//

import Foundation

enum MealTime {
    case morning
    case lunch
    case dinner
    
    var text: String {
        switch self {
        case .morning:
            return "조식"
        case .lunch:
            return "중식"
        case .dinner:
            return "석식"
        }
    }
}
