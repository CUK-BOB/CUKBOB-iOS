//
//  OnboardingView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/13/26.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var viewModel: OnboardingViewModel
    
    // MARK: - Initializer
    
    init() {
        self._viewModel = StateObject(
            wrappedValue: OnboardingViewModel()
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

extension OnboardingView {
    private var title: some View {
        TitleHeader(titleHeaderType: .nickname)
            .padding(.top, 36.adjustedHeight)
    }
    
    private var textField: some View {
        // TODO: - 바인딩 필요
        CBTextField(
            placeholder: "닉네임 입력",
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
        CBButton(title: "확인", isEnabled: true) {
            appCoordinator.changeRoot(to: .weeklyMenu)
        }
        .padding(.bottom, 11.adjustedHeight)
    }
}

#Preview {
    OnboardingView()
        .environmentObject(AppCoordinator())
}

