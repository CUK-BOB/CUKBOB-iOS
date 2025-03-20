//
//  Font+.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/20/25.
//

import SwiftUI

enum CUKBOBFont: Sendable {
    case display01
    case title01, title02, title03
    case heading01, heading02, heading03
    case body01, body02
    case label01, label02
    
    var size: CGFloat {
        switch self {
        case .display01: return 72
        case .title01: return 36
        case .title02: return 28
        case .title03: return 24
        case .heading01: return 20
        case .heading02: return 18
        case .heading03: return 16
        case .body01, .body02: return 14
        case .label01, .label02: return 12
        }
    }
    
    var letterSpacing: CGFloat {
        switch self {
        case .display01, .title01, .title02, .title03, .heading01:
            return -3
        case .body01, .body02:
            return -2
        case .heading02, .heading03, .label01, .label02:
            return -1
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .display01: return 79
        case .title01: return 43
        case .title02: return 35
        case .title03: return 31
        case .heading01: return 27
        case .heading02: return 25
        case .heading03: return 23
        case .body01, .body02: return 21
        case .label01: return 19
        case .label02: return 20
        }
    }
    
    var swiftUIFont: Font {
        switch self {
        case .display01, .title01, .title02, .title03, .heading01, .heading02, .heading03, .body01, .label01:
            return CUKBOBIOSFontFamily.Pretendard.semiBold.swiftUIFont(size: self.size)
        case .body02, .label02:
            return CUKBOBIOSFontFamily.Pretendard.medium.swiftUIFont(size: self.size)
        }
    }
}

struct FontModifier: ViewModifier {
    private let font: CUKBOBFont
    
    nonisolated init(font: CUKBOBFont) {
        self.font = font
    }
    
    func body(content: Content) -> some View {
        content
            .font(font.swiftUIFont)
            .lineSpacing((font.lineHeight - font.size) / 4)
            .kerning(font.letterSpacing)
    }
}

extension View {
    nonisolated func applyCUKBOBFont(_ font: CUKBOBFont) -> some View {
        modifier(FontModifier(font: font))
    }
}

struct CUKBOBText: View {
    private let title: String
    private let fontType: CUKBOBFont
    private let color: Color?
    
    nonisolated init(
        _ title: String,
        fontType: CUKBOBFont,
        color: Color? = Color(.gray900)
    ) {
        self.title = title
        self.fontType = fontType
        self.color = color
    }
    
    var body: some View {
        Text(title)
            .applyCUKBOBFont(fontType)
            .foregroundStyle(color ?? Color(.gray900))
    }
}
