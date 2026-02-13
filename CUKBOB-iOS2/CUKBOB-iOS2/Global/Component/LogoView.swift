//
//  LogoView.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/13/26.
//

import SwiftUI

struct LogoView: View {
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 7.adjustedHeight) {
            Image(.logo1)
                .resizable()
                .frame(width: 205.adjustedWidth, height: 48.adjustedHeight)
                .aspectRatio(contentMode: .fit)
            
            Text("가톨릭대 학식 어플 : 쿡밥")
                .applyCBFont(.subtitle04)
                .foregroundStyle(.blue200)
        }
        .padding(.top, 274.adjustedHeight)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray100)
    }
}

#Preview {
    LogoView()
}
