//
//  WeeklyMenuView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/19/25.
//

import SwiftUI

struct WeeklyMenuView: View {
    
    // MARK: - Properties
    
    @StateObject var viewModel: WeeklyMenuViewModel
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            horizontalCalendarSection
            
            Spacer()
        }
        .background {
            Color(.blue100)
        }
        .clipped()
    }
}

// MARK: - Subviews

private extension WeeklyMenuView {
    var horizontalCalendarSection: some View {
        VStack(alignment: .leading, spacing: Screen.height(24)) {
            CUKBOBText(viewModel.currentMonthString(), fontType: .label01, color: Color(.blue0))
                .padding(.horizontal, Screen.width(12))
                .padding(.vertical, Screen.height(4))
                .background(Color(.blue600))
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack(alignment: .top, spacing: 0) {
                ForEach (0..<7) { index in
                    let calenderDate = viewModel.currentWeekDates()[index]
                    if let calendarWeekDay = Weekday(rawValue: index) {
                        CalendarDayButton(
                            viewModel: viewModel,
                            weekDay: calendarWeekDay,
                            date: calenderDate
                        ) {
                            print("선택된 날짜: \(viewModel.selectedDate.dateString)")
                        }
                    }
                    
                    if index != 6 {
                        Spacer()
                    }
                }
            }
        }
        .padding(.top, Screen.height(14))
        .padding(.bottom, Screen.height(15))
        .padding(.horizontal, Screen.width(41))
        .background(Color(.gray0))
        .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
        .shadow(color: Color(.blue200), radius: 10)
    }
}

#Preview {
    WeeklyMenuView(viewModel: WeeklyMenuViewModel())
}
