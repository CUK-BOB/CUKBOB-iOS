//
//  RootViewManager.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/26/25.
//

import SwiftUI

struct RootViewManager: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    var body: some View {
        switch navigationManager.rootView {
        case .tabBar:
            TabBarView()
        case .login:
            NavigationStack(path: $navigationManager.loginPath) {
                LoginView()
                    .navigationDestination(for: Destination.self) { $0.build() }
            }
        }
    }
}

#Preview {
    RootViewManager()
        .environmentObject(NavigationManager())
}
