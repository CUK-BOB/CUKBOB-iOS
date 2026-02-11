//
//  WeeklyMenu.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import Foundation

protocol WeeklyMenuRepresentable {
    var mealTime: MealTime { get }
    var operatingHours: String { get }
}

struct StandardWeeklyMenu: WeeklyMenuRepresentable {
    let mealTime: MealTime
    let operatingHours: String
    let price: String
    let menus: [String]
}

struct MensaWeeklyMenu: WeeklyMenuRepresentable {
    let mealTime: MealTime
    let operatingHours: String
    let menuWithPrice: [MenuWithPrice]
    let platterWithPrice: [MenuWithPrice]
}

struct MenuWithPrice {
    let id = UUID()
    let title: String
    let price: String
}

extension StandardWeeklyMenu {
    static var mock: StandardWeeklyMenu {
        StandardWeeklyMenu(
            mealTime: .lunch(mealType: .noodle),
            operatingHours: "11:00 - 14:00",
            price: "5,500원",
            menus: ["콩나물 국", "쌀밥", "돈가스&케찹", "구이 김", "무말랭이 무침", "계란후라이", "배추김치"]
        )
    }
}

extension MensaWeeklyMenu {
    static var mock: MensaWeeklyMenu {
        MensaWeeklyMenu(
            mealTime: .lunch(mealType: .none),
            operatingHours: "11:00 - 14:00",
            menuWithPrice: [
                MenuWithPrice(title: "리김밥", price: "3000"),
                MenuWithPrice(title: "리김밥", price: "3000"),
                MenuWithPrice(title: "야채김밥", price: "3000"),
                MenuWithPrice(title: "야채김밥", price: "3000"),
                MenuWithPrice(title: "치즈김밥", price: "3000"),
                MenuWithPrice(title: "치즈김밥", price: "3000"),
                MenuWithPrice(title: "달콤유부우엉김밥", price: "3000"),
                MenuWithPrice(title: "달콤유부우엉김밥", price: "3000"),
                MenuWithPrice(title: "매콤견과류김밥", price: "3000"),
                MenuWithPrice(title: "매콤견과류김밥", price: "3000"),
                MenuWithPrice(title: "명란계란마요김밥", price: "3000"),
                MenuWithPrice(title: "명란계란마요김밥", price: "3000"),
                MenuWithPrice(title: "참치김밥", price: "3000"),
                MenuWithPrice(title: "참치김밥", price: "3000"),
                MenuWithPrice(title: "매콘제육김밥", price: "3000"),
                MenuWithPrice(title: "매콘제육김밥", price: "3000"),
                MenuWithPrice(title: "치즈듬뿍제육김밥", price: "3000"),
                MenuWithPrice(title: "치즈듬뿍제육김밥", price: "3000"),
                MenuWithPrice(title: "리라면", price: "3000"),
                MenuWithPrice(title: "리라면", price: "3000"),
                MenuWithPrice(title: "치즈라면", price: "3000"),
                MenuWithPrice(title: "치즈라면", price: "3000"),
                MenuWithPrice(title: "치즈라면", price: "3000"),
            ],
            platterWithPrice: [
                MenuWithPrice(title: "캠퍼스 리 플래터 (라볶이 + 리김밥 + 계란)", price: "3000"),
                MenuWithPrice(title: "캠퍼스 리 플래터 (라볶이 + 리김밥 + 계란)", price: "3000"),
                MenuWithPrice(title: "캠퍼스 리 플래터 (라볶이 + 리김밥 + 계란)", price: "3000")
            ]
        )
    }
}
