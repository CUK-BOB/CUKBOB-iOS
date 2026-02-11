//
//  MenuChips.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import SwiftUI

struct MenuChips: View {
    
    // MARK: - Properties
    
    private let menus: [String]
    
    private let horizontalSpacing: CGFloat = 8.adjustedWidth
    private let verticalSpacing: CGFloat = 8.adjustedHeight
    
    // MARK: - Initializer
    
    init(menus: [String]) {
        self.menus = menus
    }
    
    // MARK: - Body
    
    var body: some View {
        CustomFlowLayout(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing) {
            ForEach(menus, id: \.self) { menuItem in
                menuChip(menuItem)
            }
        }
    }
}

// MARK: - Functions

extension MenuChips {
    @ViewBuilder
    private func menuChip(_ menuItem: String) -> some View {
        Text(menuItem)
            .applyCBFont(.subtitle03)
            .foregroundStyle(.gray500)
            .frame(height: 20.adjustedHeight)
            .padding(.vertical, 4.adjustedHeight)
            .padding(.horizontal, 8.adjustedWidth)
            .background(.gray200)
            .cornerRadius(4, corners: .allCorners)
    }
}
