//
//  MealTime.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import Foundation

enum MealTime {
    case morning
    case lunch(mealType: MealType)
    case dinner
    
    var title: String {
        switch self {
        case .morning:
            return "조식"
        case .lunch(let mealType):
            return "중식 \(mealType.title)"
        case .dinner:
            return "석식"
        }
    }
}

enum MealType {
    case noodle
    case rice
    case none
    
    var title: String {
        switch self {
        case .noodle: return "(면)"
        case .rice: return "(밥)"
        case .none: return ""
        }
    }
}
