//
//  CalendarDayButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/19/25.
//

import SwiftUI

struct CalendarDayButton: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: WeeklyMenuViewModel
    private let weekDay: Weekday
    private let date: Date
    var onTap: (() -> Void)?
    
    private var isSelected: Bool {
        Calendar.current.isDate(viewModel.selectedDate, inSameDayAs: date)
    }
    
    // MARK: - Initializer
    
    init(
        viewModel: WeeklyMenuViewModel,
        weekDay: Weekday,
        date: Date,
        onTap: (() -> Void)? = nil
    ) {
        self.viewModel = viewModel
        self.weekDay = weekDay
        self.date = date
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        Button {
            viewModel.selectedDate = date
            onTap?()
        } label: {
            VStack(alignment: .center, spacing: 0) {
                CUKBOBText(
                    weekDay.koreanSymbol,
                    fontType: .label02,
                    color: isSelected ? Color(.blue500) : Color(.blue200)
                )
                .padding(.bottom, Screen.height(10))
                
                CUKBOBText(
                    date.dayString,
                    fontType: .heading01,
                    color: isSelected ? Color(.blue500) : Color(.blue200)
                )
                .padding(.bottom, Screen.height(4))
                
                if Calendar.current.isDateInToday(date) {
                    Circle()
                        .frame(width: Screen.width(4), height: Screen.width(4))
                        .foregroundStyle(isSelected ? Color(.blue500) : Color(.blue200))
                }
            }
        }
    }
}
