//
//  WeeklyMenuCell.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/27/25.
//

import SwiftUI

struct WeeklyMenuCell: View {
    
    // MARK: - Properties
    
    private let restaurant: Restaurant
    
    private let mealTime: MealTime
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: Screen.width(23), alignment: nil),
        GridItem(.flexible(), spacing: Screen.width(23), alignment: nil)
    ]
    
    /*
     Todo: 아래 임시 메뉴 지우고 음식이름배열, 가격 배열 주입받기
     */
    private var defaultMeals: [String] = [
        "제육볶음",
        "쌀밥",
        "들꺠무채국",
        "배추김치",
        "단호박크로켓*케찹",
        "배추김치또머겅",
        "너비아니달걀전*참나물생채",
        "배추김치또머겅",
        "배추김치또머겅",
        "배추김치또머겅",
        "배추김치또머겅",
    ]

    // MARK: - Initializer
    
    init(restaurant: Restaurant, mealTime: MealTime) {
        self.restaurant = restaurant
        self.mealTime = mealTime
    }
    
    // MARK: - body
    
    var body: some View {
        switch restaurant {
        case .cafeBona, .buonpranzoNoodle, .buonpranzoRice:
            defaultMealCell
        case .cafeMensa:
            cafeMensaCell
        }
    }
}

// MARK: - Subviews

private extension WeeklyMenuCell {
    var defaultMealCell: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Image(mealTime.icon)
                    .resizable()
                    .frame(width: Screen.width(16), height: Screen.height(16))
                    .padding(.trailing, 4)
                
                CUKBOBText(mealTime.text, fontType: .body01, color: Color(.blue600))
                    .padding(.trailing, 9)
                
                CUKBOBText("11:00 ~ 14:00", fontType: .label02, color: Color(.gray200))
                
                Spacer()
                
                CUKBOBText("5,500원", fontType: .label02, color: Color(.blue600))
            }
            .padding(.bottom, 24)
            
            let mealString = defaultMeals.joined(separator: "       ")
            
            Text(mealString)
                .applyCUKBOBFont(.label01, lineSpacing: Screen.height(12))
                .foregroundStyle(Color(.blue800))
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(24)
        .background(Color(.blue0))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    var cafeMensaCell: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(alignment: .center, spacing: 0) {
                Image(mealTime.icon)
                    .resizable()
                    .frame(width: Screen.width(16), height: Screen.height(16))
                    .padding(.trailing, 4)
                
                CUKBOBText(mealTime.text, fontType: .body01, color: Color(.blue600))
                    .padding(.trailing, 9)
                
                CUKBOBText("11:00 ~ 14:00", fontType: .label02, color: Color(.gray200))
                
                Spacer()
            }
            .padding(.bottom, 24)
            
            VStack(spacing: Screen.height(12)) {
                LazyVGrid(columns: columns, spacing: Screen.height(12)) {
                    ForEach((0..<22), id: \.self) { _ in
                        cafeMensaMealText(title: "리김밥", price: "5,000")
                    }
                }
                
                ForEach(0..<3, id: \.self) { _ in
                    cafeMensaMealText(title: "캠퍼스 리 플래터  (라볶이+리김밥+계란)", price: "7,000")
                }
            }
        }
        .padding(24)
        .background(Color(.blue0))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

// MARK: - Functions

private extension WeeklyMenuCell {
    func cafeMensaMealText(title: String, price: String) -> some View {
        HStack(spacing: 0) {
            CUKBOBText(title, fontType: .label01, color: Color(.blue800))
                .lineLimit(1)
            
            Spacer()
            
            CUKBOBText(price, fontType: .label02, color: Color(.gray400))
        }
    }
}

#Preview {
    WeeklyMenuCell(restaurant: .buonpranzoNoodle, mealTime: .dinner)
}
