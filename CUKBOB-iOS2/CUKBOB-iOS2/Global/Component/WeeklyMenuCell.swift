//
//  WeeklyMenuCell.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import SwiftUI

struct WeeklyMenuCell: View {
    
    // MARK: - Properties
    
    private let defaultWeeklyMenu: DefaultWeeklyMenu
    private let showsDivider: Bool
    
    // MARK: - Initializer
    
    //TODO: - Model을 기본용, 멘사용 만들
    
    init(defaultWeeklyMenu: DefaultWeeklyMenu, showsDivider: Bool) {
        self.defaultWeeklyMenu = defaultWeeklyMenu
        self.showsDivider = showsDivider
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            title
            
            information
            
            menuChips
            
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
    private var title: some View {
        Text("중식 (면)")
            .applyCBFont(.subtitle02)
            .foregroundStyle(.gray600)
    }
    
    private var information: some View {
        HStack(alignment: .center, spacing: 8.adjustedWidth) {
            Text("11:00 - 14:00")
            Text("5,500원")
        }
        .applyCBFont(.subtitle04)
        .foregroundStyle(.blue200)
    }
    
    private var menuChips: some View {
        MenuChips(menus: ["콩나물 국", "쌀밥", "돈가스&케찹", "구이 김", "무말랭이 무침", "계란후라이", "배추김치"])
    }
    
    private var divider: some View {
        Rectangle()
            .frame(height: 1.adjustedHeight)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.blue100)
    }
}
