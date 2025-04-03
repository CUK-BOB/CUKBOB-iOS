//
//  HomeView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            Color(.blue100)
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            
            VStack(spacing: Screen.height(0)) {
                guiSection
                
                scrollViewSection
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Subview

private extension HomeView {
    var guiSection: some View {
        Image(.tempGUI)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: Screen.width(200))
            .clipped()
            
    }
    
    var scrollViewSection: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .center, spacing: Screen.height(012), pinnedViews: [.sectionHeaders]) {
                HomeMealCell()
                HomeMealCell()
                HomeMealCell()
            }
            .padding(.horizontal, Screen.width(25))
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(NavigationManager())
}
