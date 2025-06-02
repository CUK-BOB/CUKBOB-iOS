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
        VStack {
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Spacer()
        }
        .background(.red)
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
