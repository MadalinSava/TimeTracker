//
//  TimeControllerTests.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import XCTest
@testable import TimeTrackerKit

class TimeControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testBalance() {
		let dc = DummyDataController()
		dc.totalTime = 9*60*60
		dc.numDays = 1
		
		let tc = TimeController(dataControllerAbstract: dc, timeProviderAbstract: TimeProvider())
		
		XCTAssertEqual(tc.prevBalance, 1*60*60)
	}

	func testEnterExit() {
		let tp = CustomTimeProvider()
		
		let dateComps = NSDateComponents()
		dateComps.day = 15
		dateComps.hour = 9
		dateComps.month = 1
		dateComps.year = 2016
		tp.currentTime = NSCalendar.currentCalendar().dateFromComponents(dateComps)!
		
		let dc = DummyDataController()
		dc.numDays = 1
		dc.lastDay = tp.getCurrentDay() - 1
		dc.totalTime = 7.h + 55.m
		
		var tc = TimeController(dataControllerAbstract: dc, timeProviderAbstract: tp)
		
		///////////////// BEGIN TESTS
		
		XCTAssertEqual(tc.prevBalance, -5.m)
		tc.enter()
		XCTAssertEqual(dc.numDays, 2)
		XCTAssertEqual(tc.getTodayBalance(), -8.h - 5.m)
		
		// stay 5 minutes, check today balance
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(5.m)
		XCTAssertEqual(tc.getTodayBalance(), -8.h)
		
		tc.exit()
		XCTAssertEqual(tc.getTodayBalance(), -8.h)
		
		// stay 1 hour outside, then enter
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(1.h)
		tc.enter()
		XCTAssertEqual(tc.getRegularTime(), tp.currentTime.dateByAddingTimeInterval(8.h - 5.m))
		XCTAssertEqual(tc.getFullTime(), tp.currentTime.dateByAddingTimeInterval(8.h))
		
		tc.exit()
		XCTAssertEqual(tc.getTodayBalance(), -8.h)
		tc.enter()
		
		// stay 8 hours inside
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(8.h)
		XCTAssertEqual(tc.getTodayBalance(), 0.m)
		XCTAssertEqual(tc.getRegularTime(), tp.currentTime.dateByAddingTimeInterval(-5.m))
		XCTAssertEqual(tc.getFullTime(), tp.currentTime)
		
		tc.exit()
		XCTAssertEqual(tc.getTodayBalance(), 0.m)
		
		// stay 10 minutes outside, then enter
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(10.m)
		tc.enter()
		XCTAssertEqual(tc.prevBalance, -5.m)
		
		// stay 20 minutes inside
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(20.m)
		XCTAssertEqual(tc.getTodayBalance(), 20.m)
		
		tc.exit()
		
		// next day
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(1.d)
		tc.enter()
		XCTAssertEqual(tc.prevBalance, 20.m)
		XCTAssertEqual(tc.getTodayBalance(), -8.h + 20.m)
		XCTAssertEqual(tc.getRegularTime(), tp.currentTime.dateByAddingTimeInterval(8.h))
		XCTAssertEqual(tc.getFullTime(), tp.currentTime.dateByAddingTimeInterval(8.h - 20.m))
		
		tc = TimeController(dataControllerAbstract: dc, timeProviderAbstract: tp)
		XCTAssertEqual(tc.isOutside, false)
		XCTAssertEqual(tc.prevBalance, 20.m)
		XCTAssertEqual(tc.getTodayBalance(), -8.h + 20.m)
		XCTAssertEqual(tc.getRegularTime(), tp.currentTime.dateByAddingTimeInterval(8.h))
		XCTAssertEqual(tc.getFullTime(), tp.currentTime.dateByAddingTimeInterval(8.h - 20.m))
		
		// stay 8 hours inside
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(8.h)
		tc.exit()
		XCTAssertEqual(tc.getTodayBalance(), 20.m)
		
		// previous day (new month)
		tp.currentTime = tp.currentTime.dateByAddingTimeInterval(-2.d)
		tc = TimeController(dataControllerAbstract: dc, timeProviderAbstract: tp)
		tc.enter()
		XCTAssertEqual(tc.getTodayBalance(), -8.h)
	}
}

private class DummyDataController: PDataControllerInternal {
	var timeArrived: NSDate!
	var timeLeft: NSDate!
	var timeForToday: NSTimeInterval = 0
	var totalTime: NSTimeInterval = 0
	var lastDay: Int = 0
	var numDays: Int = 0
	var isOutside: Bool = true
	
	func reload() {
		
	}
	
	func reset() {
		timeForToday = 0
		totalTime = 0
		numDays = 0
	}
}

private class CustomTimeProvider: PTimeProviderInternal {
	
	var currentTime: NSDate
	
	func getCurrentDay() -> Int {
		return NSCalendar.currentCalendar().component(.Day, fromDate: currentTime)
	}
	
	func getCurrentTime() -> NSDate {
		return currentTime
	}
	
	init() {
		currentTime = NSCalendar.currentCalendar().dateBySettingHour(8, minute: 0, second: 0, ofDate: NSDate(), options: NSCalendarOptions())!
	}
}
