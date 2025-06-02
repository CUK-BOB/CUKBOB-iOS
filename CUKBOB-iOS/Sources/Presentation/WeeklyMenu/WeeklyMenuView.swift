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
                .padding(.bottom, Screen.height(16))
            
            filterButtonSection
            
            WeeklyMenuGridSection
            
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
                .clipShape(Capsule())
            
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
    
    var filterButtonSection: some View {
        VStack(alignment: .leading, spacing: Screen.height(8)) {
            HStack(alignment: .center, spacing: Screen.width(8)) {
                ForEach(Restaurant.allCases, id: \.self) { type in
                    RestaurantFilterButton(
                        viewModel: viewModel,
                        restaurant: type
                    ) {
                        viewModel.selectedRestaurant = type
                    }
                }
            }
            
            CUKBOBText(
                "위치 : \(viewModel.selectedRestaurant.location)",
                fontType: .label01,
                color: Color(.blue200)
            )
        }
    }
    
    var WeeklyMenuGridSection: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: Screen.height(10)) {
                switch viewModel.selectedRestaurant {
                case .cafeBona:
                    WeeklyMenuCell(restaurant: .cafeBona, mealTime: .morning)
                    WeeklyMenuCell(restaurant: .cafeBona, mealTime: .lunch)
                    WeeklyMenuCell(restaurant: .cafeBona, mealTime: .dinner)
                case .buonpranzoNoodle:
                    WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .lunch)
                case .buonpranzoRice:
                    WeeklyMenuCell(restaurant: .buonpranzoRice, mealTime: .lunch)
                case .cafeMensa:
                    WeeklyMenuCell(restaurant: .cafeMensa, mealTime: .lunch)
                }
            }
            .padding(.horizontal, 24)
            .padding(.top, Screen.height(8))
            .padding(.bottom, Screen.height(16))
        }
        .padding(.top, Screen.height(8))
    }
}

#Preview {
    WeeklyMenuView(viewModel: WeeklyMenuViewModel())
}
