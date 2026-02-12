//
//  RootView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct RootView: View {
    
    // MARK: - Properties
    
    @StateObject private var appCoordinator = AppCoordinator()
    @StateObject private var alertManager = AlertManager()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $appCoordinator.path) {
            appCoordinator.root.build()
                .navigationDestination(for: AppDestination.self) { $0.build() }
        }
        .customAlert(alertManager: alertManager)
        .environmentObject(alertManager)
        .environmentObject(appCoordinator)
        .animation(.easeInOut(duration: 0.2), value: appCoordinator.root)
    }
}

#Preview {
    RootView()
}
