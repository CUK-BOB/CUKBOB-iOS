//
//  FoodAndBeverageFilterButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/29/25.
//

import SwiftUI

struct FoodAndBeverageFilterButton: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: FoodAndBeverageViewModel
    private let foodAndBeverage: FoodAndBeverage
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(
        viewModel: FoodAndBeverageViewModel,
        foodAndBeverage: FoodAndBeverage,
        onTap: (() -> Void)? = nil
    ) {
        self.viewModel = viewModel
        self.foodAndBeverage = foodAndBeverage
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            VStack(alignment: .center, spacing: Screen.height(9)) {
                Image(foodAndBeverage.icon)
                    .resizable()
                    .frame(width: Screen.width(52), height: Screen.height(52))
                    .aspectRatio(contentMode: .fit)
                
                CUKBOBText(
                    foodAndBeverage.title,
                    fontType: .label01,
                    color: viewModel.selectedFoodAndBeverage == foodAndBeverage ? Color(.blue700) : Color(.gray400)
                )
            }
        }
        .buttonStyle(.plain)
        .animation(.linear(duration: 0.2), value: viewModel.selectedFoodAndBeverage)
    }
}

#Preview {
    FoodAndBeverageFilterButton(viewModel: FoodAndBeverageViewModel(), foodAndBeverage: .all)
}
