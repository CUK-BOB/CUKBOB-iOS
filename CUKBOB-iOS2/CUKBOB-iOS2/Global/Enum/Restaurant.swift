//
//  Restaurant.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import Foundation

enum Restaurant: CaseIterable, Hashable, Identifiable {
    case buonpranzo
    case cafeBona
    case cafeMensa
    
    var id: Self { self }
    
    var title: String {
        switch self {
        case .buonpranzo:
            return "부온프란조"
        case .cafeBona:
            return "카페 보나"
        case .cafeMensa:
            return "카페 멘사"
        }
    }
    
    var location: String {
        switch self {
        case .buonpranzo:
            return "학생미래인재관 2층"
        case .cafeBona:
            return "학생미래인재관 1층"
        case .cafeMensa:
            return "김수환관 1층"
        }
    }
}
