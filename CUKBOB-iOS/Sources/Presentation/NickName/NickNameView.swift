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
        VStack(alignment: .leading, spacing: 0) {
            titleSection
                .padding(.top, Screen.height(169))
                .padding(.bottom, Screen.height(67))
            
            NickNameTextFieldWithButton(nickNameViewModel: viewModel) {
                /*
                 Todo: 닉네임 중복 확인 API 호출
                 */
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            CUKBOBButton(title: "확인", isEnabled: true) {
                navigationManager.navigate(to: .nickNameComplete)
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden()
        .background(Color(.blue0))
    }
}

// MARK: - subviews

private extension NickNameView {
    var titleSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            CUKBOBText("닉네임을 입력해주세요", fontType: .title03, color: Color(.blue500))
            
            CUKBOBText("가톨릭대 학식 정보가 기다리고 있어요 !", fontType: .body02, color: Color(.blue300))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
    }
}

#Preview {
    NickNameView(viewModel: NickNameViewModel())
        .environmentObject(NavigationManager())
}
