//
//  EditProfileView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct EditProfileView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var viewModel: EditProfileViewModel
    
    // MARK: - Initializer
    
    init() {
        self._viewModel = StateObject(
            wrappedValue: EditProfileViewModel()
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 32.adjustedWidth) {
            title
            
            textField
            
            Spacer()
            
            confirmButton
        }
        .padding(.horizontal, 32.adjustedWidth)
        .background(.gray100)
        .onTapGesture {
            hideKeyboard()
        }
        .customNavigationBar(.titleWithBack(title: "프로필수정", backAction: {
            appCoordinator.goBack()
        }))
    }
}

// MARK: - Subviews

extension EditProfileView {
    private var title: some View {
        TitleHeader(titleHeaderType: .nickname)
            .padding(.top, 36.adjustedHeight)
    }
    
    private var textField: some View {
        // TODO: - 바인딩 필요
        CBTextField(
            placeholder: "전 닉네임",
            textFieldDescriptiontype: .none,
            onChange: { text in
                print(text)
            },
            onSubmit: { text in
                print(text)
            }
        )
    }
    
    private var confirmButton: some View {
        CBButton(title: "확인", isEnabled: false) {
            print("확인")
        }
        .padding(.bottom, 11.adjustedHeight)
    }
}

#Preview {
    EditProfileView()
}
