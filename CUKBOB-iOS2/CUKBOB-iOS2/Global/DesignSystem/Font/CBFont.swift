//
//  CBFont.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import SwiftUI

enum CBFont {
    case header01
    case header02
    
    case subtitle01
    case subtitle02
    case subtitle03
    case subtitle04
    
    case body01
    case body02
    
    case caption01
    case caption02
    
    private static let scaleRatio: CGFloat = max(1.adjustedHeight, 1.adjustedWidth)
    
    private var defaultSize: CGFloat {
        switch self {
        case .header01: return 28
        case .header02: return 24
        case .subtitle01: return 18
        case .subtitle02: return 16
        case .subtitle03: return 14
        case .subtitle04: return 12
        case .body01: return 16
        case .body02: return 14
        case .caption01: return 12
        case .caption02: return 10
        }
    }
    
    var adjustedSize: CGFloat {
        return defaultSize * CBFont.scaleRatio
    }
    
    // MARK: - Letter Spacing
    
    var letterSpacing: CGFloat {
        switch self {
        default: return CGFloat(-3) / 100 * adjustedSize
        }
    }
    
    // MARK: - Line Height
    
    var lineHeight: CGFloat {
        switch self {
        case .header01: return 36
        case .header02: return 32
        case .subtitle01: return 24
        case .subtitle02: return 24
        case .subtitle03: return 20
        case .subtitle04: return 28
        case .body01: return 24
        case .body02: return 20
        case .caption01: return 18
        case .caption02: return 12
        }
    }
    
    // MARK: - Font Weight
    
    private var fontWeight: UIFont.Weight {
        switch self {
        case .header01, .header02, .subtitle01, .subtitle02, .subtitle03, .subtitle04, .caption02:
            return .bold
        case .body01, .body02, .caption01:
            return .regular
        }
    }
    
    func uiFontGuide() -> UIFont {
        switch self {
        default: return .systemFont(ofSize: self.adjustedSize, weight: self.fontWeight)
        }
    }
}

// MARK: - CBFontModifier

struct FontWithLineHeight: ViewModifier {
    let uiFont: UIFont
    let targetLineHeight: CGFloat
    let letterSpacing: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(uiFont))
            .lineSpacing(targetLineHeight - uiFont.lineHeight)
            .kerning(letterSpacing)
            .padding(.vertical, (targetLineHeight - uiFont.lineHeight) / 2)
    }
}

extension View {
    func applyCBFont(_ font: CBFont) -> some View {
        modifier(
            FontWithLineHeight(
                uiFont: font.uiFontGuide(),
                targetLineHeight: font.lineHeight,
                letterSpacing: font.letterSpacing
            )
        )
    }
}
