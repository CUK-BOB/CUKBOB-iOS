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
}

// MARK: - Func

extension Destination {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .temp:
            TempView()
        case .nickName:
            NickNameView()
        }
    }
}
