//
//  privacyPolicyView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct privacyPolicyView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    // MARK: - Body
    
    var body: some View {
        Text("개인정보 처리방침")
            .customNavigationBar(.titleWithBack(title: "개인정보 처리방침", backAction: {
                appCoordinator.goBack()
            }))
    }
}

#Preview {
    privacyPolicyView()
        .environmentObject(AppCoordinator())
}
