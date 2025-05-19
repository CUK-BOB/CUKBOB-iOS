//
//  NavigationManager.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

final class NavigationManager: ObservableObject {
    
    @Published var loginPath = NavigationPath()
    @Published var homePath = NavigationPath()
    @Published var weeklyMenuPath = NavigationPath()
    @Published var foodAndBeveragePath = NavigationPath()
    @Published var myPagePath = NavigationPath()
    
    @Published var rootView: RootView = .tabBar // 추후 로그인으로 바꾸기
    @Published var selectedTab: TabBarState = .weeklyMenu // 추후에 home으로 바꾸기
    @Published var fullScreenModal: FullScreenModalDestination?
}

// MARK: - NavigationCoordinator

extension NavigationManager: NavigationCoordinator {
    func navigate(to destination: Destination) {
        switch rootView {
        case .login:
            loginPath.append(destination)
        case .tabBar:
            navigateTab(to: destination)
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

// MARK: - Private Func

private extension NavigationManager {
    func navigateTab(to destination: Destination) {
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
}

// MARK: - Func

extension NavigationManager {
    func presentLoginView() {
        rootView = .login
        presentFullScreenModal(.login)
    }
    
    func dissmissLoginView() {
        rootView = .tabBar
        dismissFullScreenModal()
    }
}
