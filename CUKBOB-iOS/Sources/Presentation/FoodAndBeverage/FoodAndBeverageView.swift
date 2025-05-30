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
    @Namespace private var animation
    
    // MARK: - body
    
    var body: some View {
        ZStack(alignment: .top) {
            foodAndBeverageGridSection
            
            VStack(alignment: .center, spacing: 0) {
                foodAndBeverageFilterSection
                
                Spacer()
            }
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
        VStack(alignment: .leading, spacing: Screen.height(0)) {
            if viewModel.shouldShowOriginIcon {
                CUKBOBText("교내 F&B", fontType: .heading02, color: Color(.blue700))
                    .padding(.top, Screen.height(12))
            }
            
            HStack(alignment: .center, spacing: Screen.width(32)) {
                ForEach(FoodAndBeverage.allCases, id: \.self) { type in
                    FoodAndBeverageFilterButton(
                        viewModel: viewModel,
                        foodAndBeverage: type,
                        namespace: animation
                    ) {
                        viewModel.selectFoodAndBeverage(type)
                    }
                }
            }
            .padding(.top, Screen.height(viewModel.shouldShowOriginIcon ? 26 : 19))
            
            Spacer()
        }
        .frame(height: Screen.height(viewModel.shouldShowOriginIcon ? 170 : 56))
        .frame(maxWidth: .infinity)
        .background(Color(.gray0))
        .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
        .shadow(color: Color(.blue200), radius: 10)
        .animation(.bouncy(duration: 0.225), value: viewModel.shouldShowOriginIcon)
    }
    
    var foodAndBeverageGridSection: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: Screen.height(12)) {
                scrollObservableView
                    .frame(height: Screen.height(170))
                
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
                WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
            }
        }
        .onPreferenceChange(ScrollOffsetKey.self) {
            viewModel.setOffset($0)
        }
    }
    
    private var scrollObservableView: some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .global).origin.y
            Color.clear.preference(
                key: ScrollOffsetKey.self,
                value: offsetY
            )
            .onAppear {
                viewModel.setThresholdOffsetOffset(offsetY + Screen.height(50.0))
            }
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

#Preview {
    FoodAndBeverageView(viewModel: FoodAndBeverageViewModel())
}
