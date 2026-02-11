//
//  WeeklyMenuViewModel.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import Foundation
import Combine

final class WeeklyMenuViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var selectedDate: Date = Date()
    
    // MARK: - Action
    
    enum Action {
        case selectDate(_ date: Date)
    }
    
    // MARK: - Dispatch
    
    func dispatch(_ action: Action) {
        switch action {
        case .selectDate(let date):
            self.selectedDate = date
        }
    }
}
