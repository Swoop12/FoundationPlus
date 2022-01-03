//
//  Calendar+.swift
//  Taro
//
//  Created by DevMountain on 5/9/21.
//

import Foundation

public extension Calendar {
    
    func generateDates(inside interval: DateInterval, stride component: Component) -> [Date] {
        let start = interval.start
        var dates: [Date] = [start]
        var currentDate = start
        while true {
            guard let next = date(byAdding: component, value: 1, to: currentDate),
                  next < interval.end else { break }
            dates.append(next)
            currentDate = next
        }
        return dates
    }
    
    func startOfWeek(for date: Date) -> Date? {
        let components = dateComponents([.yearForWeekOfYear, .weekOfYear], from: date)
        let start = self.date(from: components)
        return start
    }
    
    func endOfWeek(for date: Date) -> Date? {
        guard let start = startOfWeek(for: date) else { return nil }
        return self.date(byAdding: .day, value: 6, to: start)
    }
    
    func startOfMonth(for date: Date) -> Date? {
        let components = dateComponents([.month, .year], from: date)
        return self.date(from: components)
    }
    
    func endOfMonth(for date: Date) -> Date? {
        guard let start = startOfMonth(for: date) else { return nil }
        return self.date(byAdding: .month, value: 1, to: start)?.addingTimeInterval(-1)
    }
    
    
    func calendarSetOfDays(for components: DateComponents) -> [Date] {
        guard
            let startOfMonth = date(from: components),
            let endOfMonth = date(byAdding: .month, value: 1, to: startOfMonth),
            let start = startOfWeek(for: startOfMonth),
            let end = endOfWeek(for: endOfMonth)
        else {
            return []
        }
        let interval = DateInterval(start: start, end: end)
        return generateDates(inside: interval, stride: .day)
    }
}
