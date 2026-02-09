//
//  WeeklyMenuView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct WeeklyMenuView: View {
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    var body: some View {
        Text("Preview 미리보기")
            .applyCBFont(.header01)
            .background(.red)
            .customNavigationBar(.weeklyMenu(myPageAction: {
                appCoordinator.navigate(to: .myPage)
            }))
    }
}

#Preview {
    WeeklyMenuView()
        .environmentObject(AppCoordinator())
}
