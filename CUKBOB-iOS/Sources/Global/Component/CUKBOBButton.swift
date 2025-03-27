//
//  CUKBOBButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

struct CUKBOBButton: View {
    
    // MARK: - Property
    
    var title: String
    var isEnabled: Bool = false
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(title: String, isEnabled: Bool = false, onTap: (() -> Void)? = nil) {
        self.title = title
        self.isEnabled = isEnabled
        self.onTap = onTap
    }
    
    // MARK: - body
    
    var body: some View {
        Button {
            onTap?()
        } label: {
            CUKBOBText(title, fontType: .heading01, color: isEnabled ? Color(.gray0) : Color(.blue200))
                .frame(height: Screen.height(60))
                .frame(maxWidth: .infinity)
                .background(isEnabled ? Color(.blue500) : Color(.gray0))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    CUKBOBButton(title: "확인")
}
