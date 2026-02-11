//
//  DefaultWeeklyMenu.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import Foundation

struct DefaultWeeklyMenu {
    let title: String
    let operatingHours: String
    let price: String
    let menus: [String]
}

extension DefaultWeeklyMenu {
    static var mock: DefaultWeeklyMenu {
        DefaultWeeklyMenu(
            title: "중식 (면)",
            operatingHours: "11:00 - 14:00",
            price: "5,500원",
            menus: ["콩나물 국", "쌀밥", "돈가스&케찹", "구이 김", "무말랭이 무침", "계란후라이", "배추김치"]
        )
    }
}
