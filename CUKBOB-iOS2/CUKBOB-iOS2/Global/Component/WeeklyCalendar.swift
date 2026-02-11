//
//  WeeklyCalendar.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct WeeklyCalendar: View {
    
    // MARK: - Properties
    
    private let currentWeekDates: [Date]
    private let selectedDate: Date
    private let onSelect: ((Date) -> Void)?
    
    private let defaultColor: Color = .gray400
    private let selectedColor: Color = .blue300
    
    // MARK: - Initializer
    
    init(selectedDate: Date, onSelect: ((Date) -> Void)? = nil) {
        self.currentWeekDates = Self.makeWeekDates()
        self.selectedDate = selectedDate
        self.onSelect = onSelect
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .top) {
            calendarContainer
            
            horizontalCalendar
                .padding(.top, 12.adjustedHeight)
                .padding(.bottom, 18.adjustedHeight)
        }
    }
}

// MARK: - Subviews

extension WeeklyCalendar {
    private var calendarContainer: some View {
        Rectangle()
            .frame(height: 90.adjustedHeight)
            .foregroundStyle(.gray100)
            .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
            .shadow(color: .black.opacity(0.07), radius: 2, x: 0, y: 5)
    }
    
    private var horizontalCalendar: some View {
        HStack(alignment: .center, spacing: 26.adjustedWidth) {
            ForEach(Array(Weekday.allCases.enumerated()), id: \.offset) { index, weekday in
                let date = currentWeekDates[index]
                weekDayButton(weekday, date: date)
            }
        }
    }
}

// MARK: - Functions

extension WeeklyCalendar {
    @ViewBuilder
    private func weekDayButton(_ weekday: Weekday, date: Date) -> some View {
        let isCurrentDay: Bool = Calendar.current.isDate(Date(), inSameDayAs: date)
        let buttonColor: Color = Calendar.current.isDate(selectedDate, inSameDayAs: date) ? selectedColor : defaultColor
        
        Button {
            onSelect?(date)
        } label: {
            VStack(alignment: .center, spacing: 4.adjustedHeight) {
                Text(weekday.title)
                    .applyCBFont(.subtitle02)
                    .foregroundStyle(buttonColor)
                
                Text(date.dayString)
                    .applyCBFont(.subtitle01)
                    .foregroundStyle(buttonColor)
                
                if isCurrentDay {
                    Circle()
                        .frame(width: 4.adjusted, height: 4.adjusted)
                        .foregroundStyle(buttonColor)
                }
            }
            .frame(width: 22.adjustedWidth, height: 60.adjustedHeight, alignment: .top)
        }
        .buttonStyle(.plain)
    }
}

extension WeeklyCalendar {
    static func makeWeekDates() -> [Date] {
        var calendar = Calendar.current
        calendar.firstWeekday = 1

        let today = Date()

        guard let interval = calendar.dateInterval(
            of: .weekOfYear,
            for: today
        ) else {
            return []
        }

        return (0..<7).compactMap {
            calendar.date(byAdding: .day, value: $0, to: interval.start)
        }
    }
}

#Preview {
    WeeklyCalendar(selectedDate: Date())
}
