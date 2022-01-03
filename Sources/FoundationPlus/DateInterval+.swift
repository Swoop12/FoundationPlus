//
//  DateInterval+.swift
//  Taro
//
//  Created by DevMountain on 4/11/21.
//

import Foundation

public extension DateInterval {
    
    static func today(calendar: Calendar = .current) -> DateInterval {
        let now = Date()
        let calendar = Calendar.current
        let startOfDay = now.startOfDay(calendar: calendar)
        let endOfDay = now.endOfDay(calendar: calendar)
        return DateInterval(start: startOfDay, end: endOfDay)
    }
}
