//
//  NickNameTextFieldWithButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

struct NickNameTextFieldWithButton: View {
    
    // MARK: - Property

    @ObservedObject var viewModel: NickNameViewModel
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(nickNameViewModel: NickNameViewModel, onTap: (() -> Void)? = nil) {
        self.viewModel = nickNameViewModel
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 14) {
                ZStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color(.blue200))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                    
                    TextField(
                        "닉네임을 입력해주세요",
                        text: $viewModel.nickName
                    )
                    .onChange(of: viewModel.nickName, initial: false) { _, newValue in
                        if (newValue.count >= 2 && newValue.count <= 5) && !newValue.containsSpecialCharacter() {
                            self.viewModel.isNickNameButtonEnabled = true
                            viewModel.nickNameState = .duplicate
                        } else {
                            self.viewModel.isNickNameButtonEnabled = false
                            viewModel.nickNameState = .count
                        }
                    }
                    .applyCUKBOBFont(.body02)
                    .frame(height: Screen.height(14))
                    .padding(.vertical, Screen.height(13))
                    .padding(.horizontal, 4)
                }
                
                Button {
                    onTap?()
                } label: {
                    CUKBOBText("중복검사", fontType: .label02, color: Color(.gray0))
                        .frame(width: Screen.width(65), height: Screen.height(40), alignment: .center)
                        .background(viewModel.isNickNameButtonEnabled ? Color(.blue500) : Color(.blue200))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .animation(.default, value: viewModel.isNickNameButtonEnabled)
                .disabled(!viewModel.isNickNameButtonEnabled)
            }
            
            HStack(spacing: 4) {
                Image(viewModel.nickNameState.icon)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(viewModel.nickNameState.color)
                    .frame(width: Screen.width(14), height: Screen.height(14))
                
                CUKBOBText(
                    viewModel.nickNameState.text,
                    fontType: .label02,
                    color: viewModel.nickNameState.color
                )
            }
        }
    }
}

#Preview {
    NickNameTextFieldWithButton(nickNameViewModel: NickNameViewModel())
}
