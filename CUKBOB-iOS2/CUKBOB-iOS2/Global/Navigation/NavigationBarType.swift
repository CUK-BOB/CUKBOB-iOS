//
//  NavigationBarType.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/9/26.
//

import Foundation

enum NavigationBarType {
    case logoWithMyPage(myPageAction: (() -> Void))
    case titleWithBack(title: String, backAction: (() -> Void))
}
