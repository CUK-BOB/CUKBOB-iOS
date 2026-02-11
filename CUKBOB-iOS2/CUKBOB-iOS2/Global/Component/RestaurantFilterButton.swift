//
//  RestaurantFilterButton.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

struct RestaurantFilterButton: View {
    
    // MARK: - Properties
    
    // MARK: - Body
    
    var body: some View {
        Button {
             
        } label: {
            Text("부온브란조")
                .applyCBFont(.subtitle04)
                .foregroundStyle(.gray400)
                .padding(.vertical, 8.adjustedHeight)
                .padding(.horizontal, 12.adjustedWidth)
                .background(.gray200)
                .capsuleClipped()
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    RestaurantFilterButton()
}
