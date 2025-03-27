//
//  NavigationCoordinator.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

public protocol NavigationCoordinator {
    func navigate(to destination: Destination)
    func popBack()
    func popToRoot()
    func replace(with destination: Destination)
    
    func switchTab(_ tab: TabBarState)
    
    func presentFullScreenModal(_ destination: FullScreenModalDestination)
    func dismissFullScreenModal()
}
