//
//  FoodAndBeverageCell.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 5/30/25.
//

import SwiftUI

struct FoodAndBeverageCell: View {
    
    // MARK: - Properties
    
    // MARK: - body
    
    var body: some View {
        Button {
            
        } label: {
            VStack(alignment: .leading, spacing: Screen.height(0)) {
                ZStack(alignment:.topLeading) {
                    Image(.tempIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity)
                        .frame(height: Screen.height(88))
                        .cornerRadius(12, corners: .allCorners)
                    
                    HStack(alignment: .center, spacing: Screen.width(3)) {
                        Image(.tempIcon)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: Screen.width(11), height: Screen.height(11))
                        
                        CUKBOBText("카페", fontType: .label02, color: Color(.gray900))
                    }
                    .padding(.horizontal, Screen.width(6))
                    .padding(.vertical, Screen.width(4))
                    .background(Color(.gray0))
                    .clipShape(Capsule())
                    .padding(.leading, Screen.width(6))
                    .padding(.top, Screen.height(7))
                }
                .padding(.top, Screen.height(8))
                .padding(.bottom, Screen.height(20))
                .padding(.horizontal, Screen.width(8))
                
                CUKBOBText("고메이플레이즈x폴바셋", fontType: .label01, color: Color(.blue500))
                    .padding(.bottom, Screen.height(4))
                    .padding(.horizontal, Screen.width(16))
                
                CUKBOBText("K관 1층, 학생회관 2층", fontType: .label02, color: Color(.blue300))
                    .padding(.bottom, Screen.height(19))
                    .padding(.horizontal, Screen.width(16))
            }
            .background(Color(.blue0))
            .cornerRadius(12, corners: .allCorners)
        }
        .buttonStyle(.plain)
    }
}
