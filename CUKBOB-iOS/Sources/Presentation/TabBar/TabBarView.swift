//
//  TabBarView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
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
        .fullScreenCover(item: $navigationManager.fullScreenModal) { destination in
            destination.build()
        }
        .onAppear {
            /*
             추후 로그인 상태 토큰으로 관리
             */
            if navigationManager.rootView == .login {
                navigationManager.presentLoginView()
            }
        }
    }
}

#Preview {
    TabBarView()
        .environmentObject(NavigationManager())
}
