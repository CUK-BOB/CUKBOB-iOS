//
//  FoodAndBeverage.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/29/25.
//

import SwiftUI

enum FoodAndBeverage: CaseIterable {
    case all
    case cafe
    case salad
    case restaurant
    
    var icon: ImageResource {
        switch self {
        case .all:
            return .tempIcon
        case .cafe:
            return .tempIcon
        case .salad:
            return .tempIcon
        case .restaurant:
            return .tempIcon
        }
    }
    
    var title: String {
        switch self {
        case .all:
            return "전체"
        case .cafe:
            return "카페"
        case .salad:
            return "샐러드"
        case .restaurant:
            return "음식점"
        }
    }
}
