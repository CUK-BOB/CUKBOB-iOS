//
//  SocialLoginButton.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/13/26.
//

import SwiftUI

struct SocialLoginButton: View {
    
    // MARK: - Properties
    
    private let socialLoginType: SocialLoginType
    private let action: (() -> Void)?
    
    // MARK: - Initializer
    
    init(_ socialLoginType: SocialLoginType, action: (() -> Void)? = nil) {
        self.socialLoginType = socialLoginType
        self.action = action
    }
    
    // MARK: - Body
    
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack(alignment: .center) {
                HStack(alignment: .center, spacing: 12.adjustedWidth) {
                    Image(socialLoginType.buttonIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 22.adjusted, height: 22.adjusted)
                    
                    Spacer()
                }
                
                Text(socialLoginType.buttonTitle)
                    .applyCBFont(.subtitle03)
                    .foregroundColor(socialLoginType.buttonTitleColor)
            }
            .frame(height: 45.adjusted)
            .padding(.leading, 16.adjustedWidth)
            .background(socialLoginType.buttonBackgroundColor)
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    SocialLoginButton(.kakao)
    SocialLoginButton(.apple)
}

