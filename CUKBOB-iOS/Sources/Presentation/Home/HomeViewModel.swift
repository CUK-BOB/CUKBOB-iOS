//
//  HomeViewModel.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 4/3/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var mealTime: MealTime = .morning
}

extension HomeViewModel {
    func selectMealTime(_ mealTime: MealTime) {
        self.mealTime = mealTime
    }
}
