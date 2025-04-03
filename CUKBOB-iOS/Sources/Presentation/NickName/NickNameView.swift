//
//  NickNameView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct NickNameView: View {
    
    // MARK: - Property
    
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: NickNameViewModel
    
    // MARK: - body
    
    var body: some View {
        ZStack {
            Color(.blue0)
                .ignoresSafeArea()
                .onTapGesture {
                    hideKeyboard()
                }
            
            VStack(alignment: .leading, spacing: 0) {
                logoSection
                
                titleSection
                
                nickNameTextFieldWithButtonSection
                
                Spacer()
                
                confirmButtonSection
            }
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea(.keyboard)
    }
}

// MARK: - Subviews

private extension NickNameView {
    var logoSection: some View {
        Image(.cukbob)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: Screen.width(85), height: Screen.height(17))
            .padding(.leading, Screen.width(27))
            .padding(.top, Screen.height(14))
    }
    
    var titleSection: some View {
        VStack(alignment: .leading, spacing: Screen.height(6)) {
            CUKBOBText("닉네임을 입력해주세요", fontType: .title03, color: Color(.blue500))
            
            CUKBOBText("가톨릭대 학식 정보가 기다리고 있어요 !", fontType: .body02, color: Color(.blue300))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Screen.width(27))
        .padding(.top, Screen.height(94))
        .padding(.bottom, Screen.height(67))
    }
    
    var nickNameTextFieldWithButtonSection: some View {
        NickNameTextFieldWithButton(viewModel: viewModel) {
            /*
             Todo: 닉네임 중복 확인 API 호출
             */
            viewModel.nickNameState = .available
            viewModel.isConfirmButtonEnabled = true
            hideKeyboard()
        }
        .padding(.horizontal, Screen.width(27))
    }
    
    var confirmButtonSection: some View {
        CUKBOBButton(isEnabled: $viewModel.isConfirmButtonEnabled, title: "확인") {
            /*
             Todo: viewModel에서 닉네임 받아서
             */
            navigationManager.navigate(to: .nickNameComplete(nickName: viewModel.getNickName))
        }
        .animation(.default, value: viewModel.isConfirmButtonEnabled)
        .padding(.horizontal, Screen.width(27))
        .padding(.bottom, Screen.height(11))
    }
}

#Preview {
    NickNameView(viewModel: NickNameViewModel())
        .environmentObject(NavigationManager())
}
