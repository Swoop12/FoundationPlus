//
//  Date+Tests.swift
//  TaroTests
//
//  Created by DevMountain on 4/25/21.
//

import XCTest
@testable import FoundationPlus

class Date_Tests: XCTestCase {
    
    // MARK: - TimeInterval Convenience Init Tests
    func testTimeIntervalCalendarPartsInit_allParameters() {
        let expected: TimeInterval = 2_205_920
        let actual = TimeInterval(weeks: 3,
                                  days: 4,
                                  hours: 12,
                                  minutes: 45,
                                  seconds: 20)
        XCTAssertEqual(expected, actual)
    }
    
    func testTimeIntervalCalendarPartsInit_weeks() {
        let expected: TimeInterval = 7_257_600
        let actual = TimeInterval(weeks: 12)
        XCTAssertEqual(expected, actual)
    }
    
    func testTimeIntervalCalendarPartsInit_days() {
        let expected: TimeInterval = 259_200
        let actual = TimeInterval(days: 3)
        XCTAssertEqual(expected, actual)
    }
    
    func testTimeIntervalCalendarPartsInit_hours() {
        let expected: TimeInterval = 28_800
        let actual = TimeInterval(hours: 8)
        XCTAssertEqual(expected, actual)
    }
    
    func testTimeIntervalCalendarPartsInit_minutes() {
        let expected: TimeInterval = 2700
        let actual = TimeInterval(minutes: 45)
        XCTAssertEqual(expected, actual)
    }
    
    func testTimeIntervalCalendarPartsInit_seconds() {
        let expected: TimeInterval = 127
        let actual = TimeInterval(seconds: 127)
        XCTAssertEqual(expected, actual)
    }
    
    func testTimeIntervalCalendarPartsInit_minutesAndSeconds() {
        let expected: TimeInterval = 2732
        let actual = TimeInterval(minutes: 45, seconds: 32)
        XCTAssertEqual(expected, actual)
    }
    
    // MARK: - Date Convenience Points
    func testStartOfDayDateExtension() {
        // Given
        var calendar = Calendar(identifier: .gregorian)
        guard let timeZone = TimeZone(secondsFromGMT: 0) else { XCTFail() ; return  }
        calendar.timeZone = timeZone
        let testDate = Date(timeIntervalSinceReferenceDate: 60 * 60 * 13)
        // When
        let startOfDay = testDate.startOfDay(calendar: calendar)
        // Then
        let expected = Date(timeIntervalSinceReferenceDate: 0)
        XCTAssertEqual(startOfDay, expected)
    }
    
    func testEndOfDayDateExtension() {
        // Given
        var calendar = Calendar(identifier: .gregorian)
        guard let timeZone = TimeZone(secondsFromGMT: 0) else { XCTFail() ; return }
        calendar.timeZone = timeZone
        let testDate = Date(timeIntervalSinceReferenceDate: 0)
        // When
        let endOfDay = testDate.endOfDay(calendar: calendar)
        // Then
        let expected = Date(timeIntervalSinceReferenceDate: (60 * 60 * 24) - 1)
        XCTAssertEqual(endOfDay, expected)
    }
}
