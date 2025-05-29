//
//  FoodAndBeverageView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/29/25.
//

import SwiftUI

struct FoodAndBeverageView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: FoodAndBeverageViewModel
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            foodAndBeverageFilterSection
            
            foodAndBeverageGridSection.zIndex(-1)
                .padding(.top, Screen.height(16))
            
            Spacer()
        }
        .background {
            Color(.blue100)
        }
        .clipped()
    }
}

// MARK: - Subviews

extension FoodAndBeverageView {
    var foodAndBeverageFilterSection: some View {
        VStack(alignment: .leading, spacing: Screen.height(26)) {
            CUKBOBText("교내 F&B", fontType: .heading02, color: Color(.blue700))
                .padding(.horizontal, Screen.width(33))
            
            HStack(alignment: .center, spacing: Screen.width(32)) {
                FoodAndBeverageFilterButton(viewModel: viewModel, foodAndBeverage: .all) {
                    viewModel.selectedFoodAndBeverage = .all
                }
                
                FoodAndBeverageFilterButton(viewModel: viewModel, foodAndBeverage: .cafe) {
                    viewModel.selectedFoodAndBeverage = .cafe
                }
                
                FoodAndBeverageFilterButton(viewModel: viewModel, foodAndBeverage: .salad) {
                    viewModel.selectedFoodAndBeverage = .salad
                }
                
                FoodAndBeverageFilterButton(viewModel: viewModel, foodAndBeverage: .restaurant) {
                    viewModel.selectedFoodAndBeverage = .restaurant
                }
            }
            .padding(.horizontal, Screen.width(35))
        }
        .padding(.top, Screen.height(13))
        .padding(.bottom, Screen.height(35))
        .background(Color(.gray0))
        .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
        .shadow(color: Color(.blue200), radius: 10)
    }
    
    var foodAndBeverageGridSection: some View {
        ScrollView {
            VStack(spacing: 12) {
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
            }
        }
    }
}

#Preview {
    FoodAndBeverageView(viewModel: FoodAndBeverageViewModel())
}
