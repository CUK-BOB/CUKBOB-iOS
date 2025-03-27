//
//  TabBarState'.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

public enum TabBarState: CaseIterable {
    case home
    case weeklyMenu
    case foodAndBeverage
    case myPage
    
    var title: String {
        switch self {
        case .home: return "홈"
        case .weeklyMenu: return "주간 학식"
        case .foodAndBeverage: return "교내 F&B"
        case .myPage: return "마이페이지"
        }
    }
    
    var defaultImage: ImageResource {
        switch self {
        case .home: return .tempIcon
        case .weeklyMenu: return .tempIcon
        case .foodAndBeverage: return .tempIcon
        case .myPage: return .tempIcon
        }
    }
    
    var selectedImage: ImageResource {
        switch self {
        case .home: return .tempIcon
        case .weeklyMenu: return .tempIcon
        case .foodAndBeverage: return .tempIcon
        case .myPage: return .tempIcon
        }
    }
}

// MARK: - Func

extension TabBarState {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .home:
            HomeView()
        case .weeklyMenu:
            Text("weeklyMenu") // 추후 수정
        case .foodAndBeverage:
            Text("foodAndBeverage") // 추후 수정
        case .myPage:
            Text("myPage") // 추후 수정
        }
    }
}
