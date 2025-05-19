//
//  WeeklyMenuViewModel.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/19/25.
//

import Foundation

final class WeeklyMenuViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var selectedDate: Date = Date()
    
    private let calendar: Calendar // 일단 일주일 고정이라서 @Published안 함
    private var weekDates: [Date] = []
    
    let todayDate: Date = Date()
    
    // MARK: - Initializer
    
    init(calendar: Calendar = .current) {
        self.calendar = calendar
        generateWeekFromToday()
    }
}

// MARK: - Functions

extension WeeklyMenuViewModel {
    private func generateWeekFromToday() {
        guard let weekInterval = calendar.dateInterval(of: .weekOfYear, for: todayDate),
              let startOfWeek = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: weekInterval.start) else {
            return
        }

        weekDates = (0..<7).compactMap { dayOffset in
            calendar.date(byAdding: .day, value: dayOffset, to: startOfWeek)
        }
    }
    
    func currentWeekDates() -> [Date] {
        return weekDates
    }
    
    func currentMonthString() -> String {
        return "\(todayDate.monthString)월"
    }
}
