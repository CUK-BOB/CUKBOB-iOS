//
//  NickNameView.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct NickNameView: View {
    
    // MARK: - Property
    
    @StateObject var viewModel: NickNameViewModel
    
    // MARK: - body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            titleSection
                .padding(.top, Screen.height(169))
                .padding(.bottom, Screen.height(67))
            
            textFieldSection
            
            Spacer()
            
            /*
             Todo: 확인 버튼 컴포넌트화
             */
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: Screen.height(60))
                .padding(.horizontal, 20)
        }
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
    
    var textFieldSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            NickNameTextField(nickNameViewModel: viewModel)
            
            HStack(spacing: 0) {
                /*
                 Todo: 느낌표 아이콘 에셋 추가
                 */
                
                CUKBOBText("2~5글자 내로 입력해주세요 (특수문자X)", fontType: .label02, color: Color(.gray400))
            }
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    NickNameView(viewModel: NickNameViewModel())
}
