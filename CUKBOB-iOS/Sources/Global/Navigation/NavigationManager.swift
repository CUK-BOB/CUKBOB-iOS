//
//  NavigationManager.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

final class NavigationManager: NavigationCoordinator, ObservableObject {
    
    @Published var homePath = NavigationPath()
    @Published var weeklyMenuPath = NavigationPath()
    @Published var foodAndBeveragePath = NavigationPath()
    @Published var myPagePath = NavigationPath()
    
    @Published var selectedTab: TabBarState = .home
    @Published var fullScreenModal: FullScreenModalDestination?
    
    func navigate(to destination: Destination) {
        switch selectedTab {
        case .home:
            homePath.append(destination)
        case .weeklyMenu:
            weeklyMenuPath.append(destination)
        case .foodAndBeverage:
            foodAndBeveragePath.append(destination)
        case .myPage:
            myPagePath.append(destination)
        }
    }
    
    func popBack() {
        switch selectedTab {
        case .home:
            homePath.removeLast()
        case .weeklyMenu:
            weeklyMenuPath.removeLast()
        case .foodAndBeverage:
            foodAndBeveragePath.removeLast()
        case .myPage:
            myPagePath.removeLast()
        }
    }
    
    func popToRoot() {
        switch selectedTab {
        case .home:
            homePath.removeLast(homePath.count)
        case .weeklyMenu:
            weeklyMenuPath.removeLast(weeklyMenuPath.count)
        case .foodAndBeverage:
            foodAndBeveragePath.removeLast(foodAndBeveragePath.count)
        case .myPage:
            myPagePath.removeLast(myPagePath.count)
        }
    }
    
    func replace(with destination: Destination) {
        switch selectedTab {
        case .home:
            popToRoot()
            navigate(to: destination)
        case .weeklyMenu:
            popToRoot()
            navigate(to: destination)
        case .foodAndBeverage:
            popToRoot()
            navigate(to: destination)
        case .myPage:
            popToRoot()
            navigate(to: destination)
        }
    }
    
    func switchTab(_ tab: TabBarState) {
        selectedTab = tab
    }
    
    func presentFullScreenModal(_ destination: FullScreenModalDestination) {
        fullScreenModal = destination
    }
    
    func dismissFullScreenModal() {
        fullScreenModal = nil
    }
}
