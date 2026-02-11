//
//  AppCoordinator.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published var path: [AppDestination] = []
    @Published var root: RootDestination = .weeklyMenu
    
    // MARK: - Functions
    
    func navigate(to destination: AppDestination) {
        path.append(destination)
    }
    
    func goBack() {
        _ = path.popLast()
    }
    
    func goToRoot() {
        path.removeAll()
    }
    
    func changeRoot(to root: RootDestination) {
        path.removeAll()
        self.root = root
    }
}
