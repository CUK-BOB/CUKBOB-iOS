//
//  Date+.swift
//  CUKBOB-iOS2
//
//  Created by 김승원 on 2/11/26.
//

import Foundation

extension Date {
    var dayString: String {
        Date.dayFormatter.string(from: self)
    }
    
    var monthString: String {
        Date.monthFormatter.string(from: self)
    }
    
    var dateString: String {
        Date.dateFormatter.string(from: self)
    }
    
    private static let dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    private static let monthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "M"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeZone = TimeZone.current
        return formatter
    }()
}
