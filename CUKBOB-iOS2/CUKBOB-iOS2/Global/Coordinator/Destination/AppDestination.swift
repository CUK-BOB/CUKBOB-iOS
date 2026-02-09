//
//  AppDestination.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

enum AppDestination: Hashable {
    case myPage
}

extension AppDestination {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .myPage:
            Text("myPage")
        }
    }
}
