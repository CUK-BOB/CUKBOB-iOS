//
//  MyPageView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct MyPageView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @EnvironmentObject private var alertManager: AlertManager
    @StateObject private var viewModel: MyPageViewModel
    
    // MARK: - Initializer
    
    init() {
        self._viewModel = StateObject(
            wrappedValue: MyPageViewModel()
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.vertical) {
            myPageOptionList
        }
        .customNavigationBar(.titleWithBack(title: "마이페이지", backAction: {
            appCoordinator.goBack()
        }))
    }
}

// MARK: - Subviews

extension MyPageView {
    private var myPageOptionList: some View {
        VStack(alignment: .center, spacing: 0) {
            ForEach(MyPageOption.allCases, id: \.self) { myPageOption in
                myPageOptionRow(myPageOption)
            }
        }
    }
    
    private func myPageOptionRow(_ myPageOption: MyPageOption) -> some View {
        VStack(alignment: .center, spacing: 0) {
            Button {
                switch myPageOption {
                case .editProfile:
                    appCoordinator.navigate(to: .editProfile)
                case .logout:
                    alertManager.show(alertType: .logout, onCancel: nil) {
                        print("로그아웃 성공")
                    }
                case .withdraw:
                    appCoordinator.navigate(to: .withdraw)
                case .privacyPolicy:
                    appCoordinator.navigate(to: .privacyPolicy)
                }
            } label: {
                HStack(alignment: .center, spacing: 12.adjustedWidth) {
                    Image(myPageOption.icon)
                        .resizable()
                        .frame(width: 20.adjusted, height: 20.adjusted)
                    
                    Text(myPageOption.title)
                        .applyCBFont(.body02)
                        .foregroundStyle(.gray600)
                    
                    Spacer()
                    
                    Image(.arrowRight)
                        .resizable()
                        .frame(width: 24.adjusted, height: 24.adjusted)
                    
                }
                .padding(.vertical, 20.adjustedHeight)
                .padding(.horizontal, 24.adjustedWidth)
                .background(.gray100)
            }
            .buttonStyle(.plain)
            
            Rectangle()
                .frame(height: 1.adjustedHeight)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.blue100)
        }
    }
}

#Preview {
    MyPageView()
        .environmentObject(AppCoordinator())
        .environmentObject(AlertManager())
}
