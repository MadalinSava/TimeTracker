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
	func getCurrentTime() -> Date
}

public class TimeProvider: PTimeProviderInternal {
	func getCurrentDay() -> Int {
		return Calendar.current.component(.day, from: Date())
	}
	
	func getCurrentTime() -> Date {
		return Date()
	}
	
	public init() {
		
	}
}
