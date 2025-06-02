//
//  RestaurantFilterButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/20/25.
//

import SwiftUI

struct RestaurantFilterButton: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: WeeklyMenuViewModel
    private let restaurant: Restaurant
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(viewModel: WeeklyMenuViewModel, restaurant: Restaurant, onTap: (() -> Void)? = nil) {
        self.viewModel = viewModel
        self.restaurant = restaurant
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            CUKBOBText(restaurant.title, fontType: .label01, color: Color(.blue300))
                .padding(.horizontal, Screen.width(12))
                .padding(.vertical, Screen.height(8))
                .background(
                    viewModel.selectedRestaurant == restaurant ? Color(.gray0) : Color(.blue0)
                )
                .cornerRadius(15, corners: .allCorners)
        }
        .buttonStyle(.plain)
        .animation(.linear(duration: 0.2), value: viewModel.selectedRestaurant)
    }
}

#Preview {
    RestaurantFilterButton(viewModel: WeeklyMenuViewModel(), restaurant: .buonpranzoNoodle)
}
