//
//  NickNameTextField.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

struct NickNameTextField: View {
    
    // MARK: - Property
    
    @State var text: String = ""
    var nickNameViewModel: NickNameViewModel
    
    // MARK: - Initializer
    
    init(nickNameViewModel: NickNameViewModel) {
        self.nickNameViewModel = nickNameViewModel
    }
    
    // MARK: - body
    
    var body: some View {
        HStack(spacing: 14) {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(Color(.blue200))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                
                TextField(
                    "닉네임을 입력해주세요",
                    text: $text
                )
                .applyCUKBOBFont(.body02)
                .frame(height: Screen.height(14))
                .padding(.vertical, Screen.height(13))
                .padding(.horizontal, 4)
            }
            
            Button {
                
            } label: {
                CUKBOBText("중복검사", fontType: .label02, color: Color(.gray0))
                    .frame(width: Screen.width(65), height: Screen.height(40), alignment: .center)
                    .background(Color(.blue200))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }
}

#Preview {
    NickNameTextField(nickNameViewModel: NickNameViewModel())
}
