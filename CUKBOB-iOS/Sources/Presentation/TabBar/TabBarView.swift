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
            NavigationStack(path: navigationManager.currentPathBinding) {
                navigationManager.selectedTab.build()
                    .navigationDestination(for: Destination.self) { $0.build() }
            }
            
            CUKBOBTabBar(selectedTab: $navigationManager.selectedTab)
        }
        .fullScreenCover(item: $navigationManager.fullScreenModal) { destination in
            destination.build()
        }
    }
}

#Preview {
    @Previewable @StateObject var navigationManager = NavigationManager()
    TabBarView()
        .environmentObject(navigationManager)
}
