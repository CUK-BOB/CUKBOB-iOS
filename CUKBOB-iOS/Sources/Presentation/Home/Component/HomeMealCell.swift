//
//  HomeMealCell.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/28/25.
//

import SwiftUI

struct HomeMealCell: View {
    
    // MARK: - Property
    
    @State private var isExpanded: Bool = false
    private let restaurant: Restaurant
    
    // 임시 메뉴
    private var meals: [String] = [
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
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            VStack(spacing: Screen.height(4)) {
                HStack(spacing: 0) {
                    Image(restaurant.icon)
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Screen.width(18), height: Screen.height(18))
                        .padding(.trailing, Screen.width(4))
                    
                    CUKBOBText(restaurant.title, fontType: .body01, color: Color(.blue500))
                        .padding(.trailing, Screen.width(8))
                    
                    CUKBOBText("08:00 ~ 09:30", fontType: .body01, color: Color(.gray200))
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(.arrowRight)
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Screen.width(18), height: Screen.height(18))
                    }
                }
                .padding(.vertical, Screen.height(16))
                .frame(maxWidth: .infinity)
                .background(.white)
                .onTapGesture {
                    withAnimation(.bouncy(duration: 0.3)) {
                        isExpanded.toggle()
                    }
                }
                .zIndex(1)
                
                if isExpanded {
                    VStack(spacing: 0) {
                        let mealString = meals.joined(separator: "       ")
                        
                        Text(mealString)
                            .applyCUKBOBFont(.label01, lineSpacing: Screen.height(12))
                            .foregroundStyle(Color(.blue800))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, Screen.height(8))
                        
                        Rectangle()
                            .fill(Color(.blue100))
                            .frame(maxWidth: .infinity)
                            .frame(height: Screen.height(1))
                            .padding(.vertical, Screen.height(16))
                        
                        HStack(spacing: 4) {
                            Image(.money)
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: Screen.width(12), height: Screen.height(12))
                            
                            CUKBOBText("5,500", fontType: .label02, color: Color(.blue500))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, Screen.height(16))
                    }
                    .transition(.opacity)
                }
            }
            .padding(.horizontal, Screen.width(24))
            .background(Color(.gray0))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.bottom, Screen.height(12))
        }
        .clipped()
    }
}

#Preview {
    HomeMealCell(restaurant: .cafeBona)
}
