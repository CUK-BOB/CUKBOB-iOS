//
//  HomeView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: HomeViewModel
    
    // MARK: - body
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: Screen.height(0)) {
                guiSection
                
                homeMealSection
            }
            .clipped()
        }
        .background {
            Color(.blue100)
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
        }
        .navigationBarBackButtonHidden()
    }
}

// MARK: - Subviews

private extension HomeView {
    var guiSection: some View {
        Image(.tempGUI)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(maxWidth: .infinity)
            .frame(height: Screen.width(120))
            .clipped()
            
    }
    
    var timeSelectSection: some View {
        HStack(spacing: 20) {
            MealTimeFilterButton(viewModel: viewModel, mealTime: .morning) {
                viewModel.selectMealTime(.morning)
            }
            
            MealTimeFilterButton(viewModel: viewModel, mealTime: .lunch) {
                viewModel.selectMealTime(.lunch)
            }
            
            MealTimeFilterButton(viewModel: viewModel, mealTime: .dinner) {
                viewModel.selectMealTime(.dinner)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, Screen.height(20))
        .background(Color(.blue100))
    }
    
    var homeMealSection: some View {
        LazyVStack(alignment: .center, spacing: Screen.height(0), pinnedViews: [.sectionHeaders]) {
            Section(header: timeSelectSection) {
                HomeMealCell(restaurant: .cafeBona)
                HomeMealCell(restaurant: .buonpranzoNoodle)
                HomeMealCell(restaurant: .buonpranzoRice)
                HomeMealCell(restaurant: .cafeMensa)
            }
        }
        .padding(.horizontal, Screen.width(24))
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
        .environmentObject(NavigationManager())
}
