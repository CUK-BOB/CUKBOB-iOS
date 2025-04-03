//
//  Restaurant.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 4/3/25.
//

import SwiftUI

enum Restaurant {
    case cafeBona
    case buonpranzoNoodle
    case buonpranzoRice
    case cafeMensa
    
    var title: String {
        switch self {
        case .cafeBona:
            return "카페 보나"
        case .buonpranzoNoodle:
            return "부온프란조_면"
        case .buonpranzoRice:
            return "부온프란조_밥"
        case .cafeMensa:
            return "카페 멘사"
        }
    }
    
    var icon: ImageResource {
        switch self {
        case .cafeBona:
            return .rice
        case .buonpranzoNoodle:
            return .noodle
        case .buonpranzoRice:
            return .rice
        case .cafeMensa:
            return .snackfood2
        }
    }
}
