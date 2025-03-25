//
//  TabBarView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            switch navigationManager.selectedTab {
            case .home:
                NavigationStack(path: $navigationManager.homePath) {
                    navigationManager.selectedTab.build()
                        .navigationDestination(for: Destination.self) { $0.build() }
                }
            case .weeklyMenu:
                NavigationStack(path: $navigationManager.weeklyMenuPath) {
                    navigationManager.selectedTab.build()
                        .navigationDestination(for: Destination.self) { $0.build() }
                }
            case .foodAndBeverage:
                NavigationStack(path: $navigationManager.foodAndBeveragePath) {
                    navigationManager.selectedTab.build()
                        .navigationDestination(for: Destination.self) { $0.build() }
                }
            case .myPage:
                NavigationStack(path: $navigationManager.myPagePath) {
                    navigationManager.selectedTab.build()
                        .navigationDestination(for: Destination.self) { $0.build() }
                }
            }
            
            CUKBOBTabBar(selectedTab: $navigationManager.selectedTab)
        }
        .onAppear {
            if !isLoggedIn {
                navigationManager.presentFullScreenModal(.login)
            }
        }
        .fullScreenCover(item: $navigationManager.fullScreenModal) { destination in
            destination.build()
                .onDisappear {
                    if destination == .login {
                        isLoggedIn = true // 일단 로그인 화면에서 돌아오면 로그인 되어있다고 가정
                    }
                }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(NavigationManager())
}
