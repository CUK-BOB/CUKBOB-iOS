//
//  SplashView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/13/26.
//

import SwiftUI

struct SplashView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .center) {
            LogoView()
        }
        .onAppear {
            Task {
                await decideInitialRoute()
            }
        }
    }
}

// MARK: - Functions

extension SplashView {
    @MainActor
    private func decideInitialRoute() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)

        // TODO: - api 연결 후 자동로그인 연결
        appCoordinator.changeRoot(to: .auth)
    }
}
