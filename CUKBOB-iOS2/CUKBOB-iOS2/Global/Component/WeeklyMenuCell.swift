//
//  WeeklyMenuCell.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import SwiftUI

struct WeeklyMenuCell: View {
    
    // MARK: - Properties
    
    private let weeklyMenuType: WeeklyMenuType
    private let showsDivider: Bool
    
    // MARK: - Initializer
    
    init(weeklyMenuType: WeeklyMenuType, showsDivider: Bool) {
        self.weeklyMenuType = weeklyMenuType
        self.showsDivider = showsDivider
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            switch weeklyMenuType {
            case .standard(let standardWeeklyMenu):
                standardMenu(standardWeeklyMenu)
            case .mensa(let mensaWeeklyMenu):
                mensaMenu(mensaWeeklyMenu)
            }
            
            if showsDivider {
                divider
                    .padding(.top, 24.adjustedHeight)
            }
        }
        .padding(.vertical, 12.adjustedHeight)
    }
}

// MARK: - Subviews

extension WeeklyMenuCell {
    private func standardMenu(_ standardWeeklyMenu: StandardWeeklyMenu) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(standardWeeklyMenu.mealTime.title)
                .applyCBFont(.subtitle02)
                .foregroundStyle(.gray600)
            
            HStack(alignment: .center, spacing: 8.adjustedWidth) {
                Text(standardWeeklyMenu.operatingHours)
                Text(standardWeeklyMenu.price)
            }
            .applyCBFont(.subtitle04)
            .foregroundStyle(.blue200)
            
            MenuChips(standardWeeklyMenu.menus)
        }
    }
    
    @ViewBuilder
    private func mensaMenu(_ mensaWeeklyMenu: MensaWeeklyMenu) -> some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

        VStack(alignment: .leading, spacing: 0) {
            Text(mensaWeeklyMenu.mealTime.title)
                .applyCBFont(.subtitle02)
                .foregroundStyle(.gray600)
            
            Text(mensaWeeklyMenu.operatingHours)
                .applyCBFont(.subtitle04)
                .foregroundStyle(.blue200)
            
            LazyVGrid(columns: columns, spacing: 8.adjustedHeight) {
                ForEach(mensaWeeklyMenu.menuWithPrice, id: \.id) { menu in
                    menuPriceRow(
                        title: menu.title,
                        price: menu.price
                    )
                }
            }
            .padding(.top, 12.adjustedHeight)

            LazyVStack(alignment: .center, spacing: 8.adjustedHeight) {
                ForEach(mensaWeeklyMenu.platterWithPrice, id: \.id) { platter in
                    menuPriceRow(
                        title: platter.title,
                        price: platter.price
                    )
                }
            }
            .padding(.top, 8.adjustedHeight)
        }
    }
    
    private func menuPriceRow(
        title: String,
        price: String
    ) -> some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            Text(title)
                .frame(height: 20.adjustedHeight)
                .applyCBFont(.subtitle03)
                .padding(.vertical, 4.adjustedHeight)
                .padding(.horizontal, 8.adjustedWidth)
                .background(.gray200)
                .cornerRadius(4, corners: .allCorners)
            
            Spacer()
            
            Text(price)
                .applyCBFont(.subtitle04)
        }
        .foregroundStyle(.gray500)
    }

    
    private var divider: some View {
        Rectangle()
            .frame(height: 1.adjustedHeight)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.blue100)
    }
}
