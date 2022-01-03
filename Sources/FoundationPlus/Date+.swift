//
//  Date+.swift
//  Taro
//
//  Created by DevMountain on 4/11/21.
//

import Foundation

public extension Date {
    
    func startOfDay(calendar: Calendar = .current) -> Date {
        let unitFlags = Set<Calendar.Component>([.year, .month, .day])
        let components = calendar.dateComponents(unitFlags, from: self)
        return calendar.date(from: components)!
    }
    
    func endOfDay(calendar: Calendar = .current) -> Date {
        var components = DateComponents()
        components.day = 1
        let date = calendar.date(byAdding: components, to: startOfDay(calendar: calendar))
        return (date?.addingTimeInterval(-1))!
    }
}

public extension TimeInterval {
    
    init(weeks: Int = 0,
         days: Int = 0,
         hours: Int = 0,
         minutes: Int = 0,
         seconds: Double = 0) {
        let dayCount = (weeks * 7) + days
        let hourCount = (dayCount * 24) + hours
        let minuteCount = (hourCount * 60) + minutes
        let secondCount = Double(minuteCount * 60) + seconds
        self.init(secondCount)
    }
}
