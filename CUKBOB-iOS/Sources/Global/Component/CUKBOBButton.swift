//
//  CUKBOBButton.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

struct CUKBOBButton: View {
    
    // MARK: - Property
    
    @Binding var isEnabled: Bool
    var title: String
    var onTap: (() -> Void)?
    
    // MARK: - Initializer
    
    init(isEnabled: Binding<Bool>, title: String, onTap: (() -> Void)? = nil) {
        self._isEnabled = isEnabled
        self.title = title
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
        .buttonStyle(.plain)
        .disabled(!isEnabled)
    }
}
