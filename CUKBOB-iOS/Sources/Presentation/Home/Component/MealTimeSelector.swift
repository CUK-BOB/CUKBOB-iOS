//
//  MealTimeSelector.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/28/25.
//

import SwiftUI

struct MealTimeSelector: View {
    
    // MARK: - body
    
    var body: some View {
        HStack(spacing: 8) {
            Image(.tempIcon)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: Screen.width(16), height: Screen.height(16))
            
            CUKBOBText("조식", fontType: .heading03, color: Color(.blue300))
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 12)
        .background(Color(.blue0))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onTapGesture {
            print("eh")
        }
    }
}

// MARK: - Subview


#Preview {
    MealTimeSelector()
}
