//
//  String+.swift
//  CUKBOB-iOS
//
//  Created by 김승원 on 3/27/25.
//

import SwiftUI

extension String {
    func containsSpecialCharacter() -> Bool {
        let regex = ".*[^a-zA-Z0-9가-힣].*"  // 특수문자 체크 (영어, 숫자, 한글 제외)
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
