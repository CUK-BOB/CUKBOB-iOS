//
//  Destination.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

public enum Destination: Hashable {
    case temp
    case nickName
    case nickNameComplete(nickName: String)
    case seeReview
}

// MARK: - Func

extension Destination {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .temp:
            TempView()
        case .nickName:
            NickNameView(viewModel: NickNameViewModel())
        case .nickNameComplete(let nickName):
            NickNameCompleteView(nickName: nickName)
        case .seeReview:
            SeeReviewView(viewModel: SeeReviewViewModel())
        }
    }
}
