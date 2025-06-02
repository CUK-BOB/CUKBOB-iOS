//
//  SeeReviewView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 6/2/25.
//

import SwiftUI

struct SeeReviewView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: SeeReviewViewModel
    
    // MARK: - body
    
    var body: some View {
        ScrollView {
            HStack {

                Text("hello")
                    .frame(maxWidth: .infinity)
            }
        }
        .background(Color(.blue100))
        .customNavigationBar(.seeReview(backAction: navigationManager.popBack))
        .onDidAppear {
            withAnimation(.easeOut(duration: 0.15)) {
                navigationManager.shouldHideTabBar = true
            }
        }
        .onDisappear {
            withAnimation(.easeOut(duration: 0.15)) {
                navigationManager.shouldHideTabBar = false
            }
        }
    }
}

#Preview {
    SeeReviewView(viewModel: SeeReviewViewModel())
}
