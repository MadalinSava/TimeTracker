//
//  TimeController.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import Foundation

public class TimeController {
	
	public var isOutside: Bool {
		return dataController.isOutside
	}
	
	public private(set) var prevBalance: NSTimeInterval
	
	private let dataController: PDataControllerInternal
	private let timeProvider: PTimeProviderInternal
	private let eightHours = 8.h
	
	public func enter() {
		let currentDay = timeProvider.getCurrentDay()
		if dataController.lastDay > currentDay {
			dataController.reset()
			dataController.lastDay = currentDay
			dataController.numDays = 1
		} else if dataController.lastDay < currentDay {
			dataController.totalTime += dataController.timeForToday
			dataController.timeForToday = 0
			prevBalance = dataController.totalTime - NSTimeInterval(dataController.numDays) * eightHours
			
			dataController.lastDay = currentDay
			dataController.numDays++
		}
		
		dataController.timeArrived = timeProvider.getCurrentTime()
		
		dataController.isOutside = false
	}
	
	public func exit() {
		dataController.timeForToday += timeProvider.getCurrentTime().timeIntervalSinceDate(dataController.timeArrived)
		
		dataController.isOutside = true
	}
	
	public func reloadData() {
		dataController.reload()
	}
	
	public func getFullTime() -> NSDate {
		return dataController.timeArrived.dateByAddingTimeInterval(eightHours - dataController.timeForToday - prevBalance)
	}
	
	public func getRegularTime() -> NSDate {
		return dataController.timeArrived.dateByAddingTimeInterval(eightHours - dataController.timeForToday)
	}
	
	public func getTodayBalance() -> NSTimeInterval {
		var time = dataController.totalTime + dataController.timeForToday - NSTimeInterval(dataController.numDays) * eightHours
		if isOutside == false {
			time += timeProvider.getCurrentTime().timeIntervalSinceDate(dataController.timeArrived)
		}
		
		return time
	}
	
	public init(dataControllerAbstract: PDataController, timeProviderAbstract: PTimeProvider) {
		self.dataController = dataControllerAbstract as! PDataControllerInternal
		self.timeProvider = timeProviderAbstract as! PTimeProviderInternal
		
		var prevNumDays = dataController.numDays
		if dataController.lastDay == timeProvider.getCurrentDay() {
			prevNumDays--
		}
		prevBalance = dataController.totalTime - NSTimeInterval(prevNumDays) * eightHours
	}
}
