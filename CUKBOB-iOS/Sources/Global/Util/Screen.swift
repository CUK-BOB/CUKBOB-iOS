//
//  Screen+.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/25/25.
//

import SwiftUI

struct Screen {
    /// 다양한 화면에서 width 비율을 같게 하기 위해 사용하는 코드
    static func width(_ value: CGFloat) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        let designWidth: CGFloat = 375.0 // iphone 13 mini 기준일 경우
        return screenWidth / designWidth * value
    }
    
    /// 다양한 화면에서 height 비율을 같게 하기 위해 사용하는 코드
    static func height(_ value: CGFloat) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        let designHeight: CGFloat = 812.0 // iphone 13 mini 기준일 경우
        return screenHeight / designHeight * value
    }
}
