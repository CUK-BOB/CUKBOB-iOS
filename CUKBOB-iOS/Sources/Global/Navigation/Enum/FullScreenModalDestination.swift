//
//  FullScreenModalDestination.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

public enum FullScreenModalDestination: Hashable, Identifiable {
    case login
    
    public var id: UUID {
        switch self {
        case .login: return UUID()
        }
    }
}

// MARK: - Func

extension FullScreenModalDestination {
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .login:
            LoginView()
        }
    }
}
