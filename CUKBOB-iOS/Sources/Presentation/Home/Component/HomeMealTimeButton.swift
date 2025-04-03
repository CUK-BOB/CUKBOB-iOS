//
//  HomeMealTimeButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 4/3/25.
//

import SwiftUI

struct HomeMealTimeButton: View {
    
    // MARK: - Property
    
    private let mealTime: MealTime
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(mealTime: MealTime, onTap: (() -> Void)? = nil) {
        self.mealTime = mealTime
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: 8) {
                Image(mealTime.icon)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Screen.width(16), height: Screen.height(16))
                
                CUKBOBText(mealTime.text, fontType: .heading04, color: Color(.blue300))
            }
            .padding(.horizontal, Screen.width(12))
            .padding(.vertical, Screen.height(4))
            .background(Color(.blue0))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

#Preview {
    HomeMealTimeButton(mealTime: .morning)
}
