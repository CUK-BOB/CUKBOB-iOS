//
//  WeeklyMenuView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct WeeklyMenuView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var viewModel: WeeklyMenuViewModel
    
    // MARK: - Initializer
    
    init() {
        self._viewModel = StateObject(
            wrappedValue: WeeklyMenuViewModel()
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 12.adjustedHeight) {
            weeklyCalendar
            
            VStack(alignment: .leading, spacing: 0) {
                restaurantFilter
                
                ScrollView(.vertical) {
                    weeklyMenuList
                }
            }
            .padding(.horizontal, 32.adjustedWidth)
        }
        .customNavigationBar(.weeklyMenu(myPageAction: {
            appCoordinator.navigate(to: .myPage)
        }))
    }
}

// MARK: - Subviews

extension WeeklyMenuView {
    private var weeklyCalendar: some View {
        WeeklyCalendar(selectedDate: viewModel.selectedDate) { date in
            viewModel.dispatch(.selectDate(date))
        }
    }
    
    private var restaurantFilter: some View{
        HStack(alignment: .center, spacing: 12.adjustedWidth) {
            ForEach(Restaurant.allCases) { restaurant in
                RestaurantFilterButton(
                    restaurant: restaurant,
                    selectedRestaurant: viewModel.selectedRestaurant
                ) { restaurant in
                    viewModel.dispatch(.selectRestaurant(restaurant))
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12.adjustedHeight)
    }
    
    private var weeklyMenuList: some View {
        WeeklyMenuCell(defaultWeeklyMenu: DefaultWeeklyMenu.mock, showsDivider: true)
    }
}

#Preview {
    WeeklyMenuView()
        .environmentObject(AppCoordinator())
}
