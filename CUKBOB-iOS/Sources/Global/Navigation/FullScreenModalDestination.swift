//
//  FullScreenModalDestination.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

public enum FullScreenModalDestination: Hashable, Identifiable {
    case temp
    
    public var id: UUID {
        switch self {
        case .temp: return UUID()
        }
    }
    
    @ViewBuilder
    func build() -> some View {
        switch self {
        case .temp:
            TempView()
        }
    }
}
