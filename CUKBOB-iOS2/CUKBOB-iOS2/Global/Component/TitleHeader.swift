//
//  TitleHeader.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/12/26.
//

import SwiftUI

struct TitleHeader: View {
    
     // MARK: - Properties
    
    private let titleHeaderType: TitleHeaderType
    
    // MARK: - Initializer
    
    init(titleHeaderType: TitleHeaderType) {
        self.titleHeaderType = titleHeaderType
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6.adjustedHeight) {
            Text(titleHeaderType.title)
                .applyCBFont(.header02)
                .foregroundStyle(.blue300)
            
            Text(titleHeaderType.subtitle)
                .applyCBFont(.body02)
                .foregroundStyle(.blue200)
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
