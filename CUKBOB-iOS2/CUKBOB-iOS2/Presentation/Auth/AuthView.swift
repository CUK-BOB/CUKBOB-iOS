//
//  AuthView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/13/26.
//

import SwiftUI

struct AuthView: View {
    
    // MARK: - Properties
    
    @EnvironmentObject private var appCoordinator: AppCoordinator
    @StateObject private var viewModel: AuthViewModel
    
    // MARK: - Initializer
    
    init() {
        self._viewModel = StateObject(
            wrappedValue: AuthViewModel()
        )
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            logoView
            
            authButtons
        }
    }
}

// MARK: - Subviews

extension AuthView {
    private var logoView: some View {
        LogoView()
    }
    
    private var authButtons: some View {
        VStack(alignment: .center, spacing: 12.adjustedHeight) {
            VStack(alignment: .center, spacing: 12.adjustedHeight) {
                SocialLoginButton(.kakao) {
                    print("kakao로 로그인")
                }
                
                SocialLoginButton(.apple) {
                    print("apple로 로그인")
                }
            }
        }
        .padding(.horizontal, 37.adjustedWidth)
        .padding(.bottom, 190.adjustedHeight)
    }
}

#Preview {
    AuthView()
        .environmentObject(AppCoordinator())
}
