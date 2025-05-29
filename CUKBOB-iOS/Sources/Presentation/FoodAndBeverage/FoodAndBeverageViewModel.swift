//
//  FoodAndBeverageViewModel.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/29/25.
//

import SwiftUI

final class FoodAndBeverageViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var selectedFoodAndBeverage: FoodAndBeverage = .all
    @Published var shouldShowOriginIcon: Bool = true
    
    private var thresholdOffset: CGFloat = 0
    private var isCheckedOriginOffset: Bool = false
}

// MARK: - Functions

extension FoodAndBeverageViewModel {
    func setThresholdOffsetOffset(_ offset: CGFloat) {
        guard !isCheckedOriginOffset else { return }
        self.thresholdOffset = offset
        isCheckedOriginOffset = true
    }
    
    func setOffset(_ offset: CGFloat) {
        guard isCheckedOriginOffset else { return }
        shouldShowOriginIcon = offset > thresholdOffset
    }
    
    func selectFoodAndBeverage(_ foodAndBeverage: FoodAndBeverage) {
        self.selectedFoodAndBeverage = foodAndBeverage
    }
}
