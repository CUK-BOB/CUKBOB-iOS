//
//  CBButton.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct CBButton: View {
    
    // MARK: - Properties
    
    private let title: String
    private let isEnabled: Bool
    private let action: (() -> Void)?
    
    private var buttonColor: Color {
        isEnabled ? .blue200 : .blue100
    }
    
    // MARK: - Initializer
    
    init(
        title: String,
        isEnabled: Bool = true,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.isEnabled = isEnabled
        self.action = action
    }
    
    // MARK: - Body
    
    var body: some View {
        Button {
            
        } label: {
            ZStack(alignment: .center) {
                Rectangle()
                    .frame(height: 60.adjustedHeight)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(buttonColor)
                    .cornerRadius(12, corners: .allCorners)
                
                Text(title)
                    .applyCBFont(.subtitle01)
                    .foregroundStyle(.gray100)
            }
        }
        .allowsHitTesting(isEnabled)
        .buttonStyle(.plain)
    }
}
