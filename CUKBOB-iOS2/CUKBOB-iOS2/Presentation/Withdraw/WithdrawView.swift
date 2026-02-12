//
//  WithdrawView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct WithdrawView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @EnvironmentObject private var alertManager: AlertManager
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
        .customNavigationBar(.titleWithBack(title: "회원탈퇴", backAction: {
            appCoordinator.goBack()
        }))
    }
}

// MARK: - Subviews

extension WithdrawView {
    private var title: some View {
        TitleHeader(titleHeaderType: .withdraw)
            .padding(.top, 36.adjustedHeight)
    }
    
    private var textField: some View {
        // TODO: - 바인딩 필요
        CBTextField(
            placeholder: "회원탈퇴",
            textFieldDescriptiontype: .withdrawalWarning,
            onChange: { text in
                print(text)
            },
            onSubmit: { text in
                print(text)
            }
        )
    }
    
    private var confirmButton: some View {
        CBButton(title: "탈퇴하기", isEnabled: true) {
            alertManager.show(alertType: .withdraw, onCancel: nil) {
                print("탈퇴하기")
            }
        }
        .padding(.bottom, 11.adjustedHeight)
    }
}

#Preview {
    WithdrawView()
        .environmentObject(AppCoordinator())
        .environmentObject(AlertManager())
}
