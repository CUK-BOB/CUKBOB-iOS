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
    private let namespace: Namespace.ID
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(
        viewModel: FoodAndBeverageViewModel,
        foodAndBeverage: FoodAndBeverage,
        namespace: Namespace.ID,
        onTap: (() -> Void)? = nil
    ) {
        self.viewModel = viewModel
        self.foodAndBeverage = foodAndBeverage
        self.namespace = namespace
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            VStack(alignment: .center, spacing: Screen.height(9)) {
                HStack(alignment: .center, spacing: Screen.width(8)) {
                    Image(foodAndBeverage.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: Screen.width(viewModel.shouldShowOriginIcon ? 52 : 14),
                            height: Screen.height(viewModel.shouldShowOriginIcon ? 52 : 14)
                        )
                        .matchedGeometryEffect(id: "\(foodAndBeverage.title)-icon", in: namespace)
                    
                    if !viewModel.shouldShowOriginIcon {
                        CUKBOBText(
                            foodAndBeverage.title,
                            fontType: .body01,
                            color: viewModel.selectedFoodAndBeverage == foodAndBeverage ? Color(.blue700) : Color(.gray400)
                        )
                        .frame(
                            width: Screen.width(
                                foodAndBeverage == .all || foodAndBeverage == .cafe ? 25 : 37
                            )
                        )
                        .matchedGeometryEffect(id: "\(foodAndBeverage.title)-label", in: namespace)
                    }
                }
                
                if viewModel.shouldShowOriginIcon {
                    CUKBOBText(
                        foodAndBeverage.title,
                        fontType: .label01,
                        color: viewModel.selectedFoodAndBeverage == foodAndBeverage ? Color(.blue700) : Color(.gray400)
                    )
                    .frame(width: Screen.width(36))
                    .matchedGeometryEffect(id: "\(foodAndBeverage.title)-label", in: namespace)
                }
            }
        }
        .buttonStyle(.plain)
        .animation(.linear(duration: 0.2), value: viewModel.selectedFoodAndBeverage)
    }
}
