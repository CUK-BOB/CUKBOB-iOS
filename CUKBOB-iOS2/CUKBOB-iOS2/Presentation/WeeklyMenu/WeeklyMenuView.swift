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
        VStack(alignment: .center, spacing: 0) {
            weeklyCalendar
            
            ScrollView(.vertical) {
                restaurantFilter
            }
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
            ForEach(0..<3) { _ in
                RestaurantFilterButton()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 24.adjustedHeight)
        .padding(.horizontal, 32.adjustedWidth)
    }
}

#Preview {
    WeeklyMenuView()
        .environmentObject(AppCoordinator())
}
