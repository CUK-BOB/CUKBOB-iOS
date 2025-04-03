//
//  HomeMealCell.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/28/25.
//

import SwiftUI

struct HomeMealCell: View {
    
    // MARK: - Properties
    
    @State private var isExpanded: Bool = false
//    private var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 23, alignment: nil),
        GridItem(.flexible(), spacing: 23, alignment: nil)
    ]
    private let restaurant: Restaurant
    
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
                    switch restaurant {
                    case .cafeBona, .buonpranzoNoodle, .buonpranzoRice:
                        defaultMealCell
                    case .cafeMensa:
                        cafeMensaCell
                    }
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

// MARK: - Subviews

private extension HomeMealCell {
    var defaultMealCell: some View {
        VStack(spacing: 0) {
            let mealString = defaultMeals.joined(separator: "       ")
            
            Text(mealString)
                .applyCUKBOBFont(.label01, lineSpacing: Screen.height(12))
                .foregroundStyle(Color(.blue800))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, Screen.height(8)) // 16 + 8 = 24
            
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
    
    var cafeMensaCell: some View {
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
        .padding(.top, Screen.height(8)) // 16 + 8 = 24
        .padding(.bottom, Screen.height(16))
    }
}

// MARK: - Functions

private extension HomeMealCell {
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
    HomeMealCell(restaurant: .cafeBona)
}
