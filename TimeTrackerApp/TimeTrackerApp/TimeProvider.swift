//
//  TimeProvider.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 06/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import Foundation

public protocol PTimeProvider: class {
}

protocol PTimeProviderInternal: PTimeProvider {
	func getCurrentDay() -> Int
	func getCurrentTime() -> NSDate
}

public class TimeProvider: PTimeProviderInternal {
	func getCurrentDay() -> Int {
		return NSCalendar.currentCalendar().component(.Day, fromDate: NSDate())
	}
	
	func getCurrentTime() -> NSDate {
		return NSDate()
	}
	
	public init() {
		
	}
}
