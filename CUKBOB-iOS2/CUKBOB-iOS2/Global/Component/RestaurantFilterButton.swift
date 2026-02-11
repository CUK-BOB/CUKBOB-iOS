//
//  RestaurantFilterButton.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct RestaurantFilterButton: View {
    
    // MARK: - Properties
    
    private let restaurant: Restaurant
    private let selectedRestaurant: Restaurant
    private let onSelect: ((Restaurant) -> Void)?
    
    private var isSelected: Bool {
        restaurant == selectedRestaurant
    }
    
    // MARK: - Initializer
    
    init(
        restaurant: Restaurant,
        selectedRestaurant: Restaurant,
        onSelect: ((Restaurant) -> Void)? = nil
    ) {
        self.restaurant = restaurant
        self.selectedRestaurant = selectedRestaurant
        self.onSelect = onSelect
    }
    
    // MARK: - Body
    
    var body: some View {
        Button {
            onSelect?(restaurant)
        } label: {
            Text(restaurant.title)
                .applyCBFont(.subtitle04)
                .frame(height: 18.adjustedHeight)
                .foregroundStyle(isSelected ? .gray100 : .gray400)
                .padding(.vertical, 8.adjustedHeight)
                .padding(.horizontal, 12.adjustedWidth)
                .background(isSelected ? .blue200 : .gray200)
                .capsuleClipped()
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    RestaurantFilterButton(restaurant: .buonpranzo, selectedRestaurant: .buonpranzo)
}
