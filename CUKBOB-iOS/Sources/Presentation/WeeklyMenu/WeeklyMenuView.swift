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
    
    var filterButtonSection: some View {
        VStack(alignment: .leading, spacing: Screen.height(8)) {
            HStack(alignment: .center, spacing: Screen.width(8)) {
                RestaurantFilterButton(viewModel: viewModel, restaurant: .buonpranzoRice) {
                    viewModel.selectedRestaurant = .buonpranzoRice
                }
                
                RestaurantFilterButton(viewModel: viewModel, restaurant: .buonpranzoNoodle) {
                    viewModel.selectedRestaurant = .buonpranzoNoodle
                }
                
                RestaurantFilterButton(viewModel: viewModel, restaurant: .cafeBona) {
                    viewModel.selectedRestaurant = .cafeBona
                }
                
                RestaurantFilterButton(viewModel: viewModel, restaurant: .cafeMensa) {
                    viewModel.selectedRestaurant = .cafeMensa
                }
            }
            
            CUKBOBText(
                "위치 : \(viewModel.selectedRestaurant.location)",
                fontType: .label01,
                color: Color(.blue200)
            )
        }
    }
}

#Preview {
    WeeklyMenuView(viewModel: WeeklyMenuViewModel())
}
