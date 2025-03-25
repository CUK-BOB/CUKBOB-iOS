//
//  NavigationCoordinator.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

public protocol NavigationCoordinator {
    
    var homePath: NavigationPath { get set }
    var weeklyMenuPath: NavigationPath { get set }
    var foodAndBeveragePath: NavigationPath { get set }
    var myPagePath: NavigationPath { get set }
    
    var selectedTab: TabBarState { get set }
    var fullScreenModal: FullScreenModalDestination? { get set }
    
    func navigate(to destination: Destination)
    func popBack()
    func popToRoot()
    func replace(with destination: Destination)
    
    func switchTab(_ tab: TabBarState)
    
    func presentFullScreenModal(_ destination: FullScreenModalDestination)
    func dismissFullScreenModal()
    
    var currentPathBinding: Binding<NavigationPath> { get }
}
