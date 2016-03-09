//
//  DataController.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import Foundation

public protocol PDataController: class {
}

protocol PDataControllerInternal: PDataController {
	var timeArrived: NSDate! {get set}
	var timeLeft: NSDate! {get set}
	var timeForToday: NSTimeInterval {get set}
	var totalTime: NSTimeInterval {get set}
	var lastDay: Int {get set}
	var numDays: Int {get set}
	var isOutside: Bool {get set}
	
	func reload()
	func reset()
}

public class DataController: PDataControllerInternal {
	
	var timeArrived: NSDate! {
		didSet {
			userDefaults.setValue(timeArrived, forKey: "timeArrived")
			registerForSave()
		}
	}
	
	var timeLeft: NSDate! {
		didSet {
			userDefaults.setValue(timeLeft, forKey: "timeLeft")
			registerForSave()
		}
	}
	
	var timeForToday = 0.0 {
		didSet {
			userDefaults.setValue(timeForToday, forKey: "timeForToday")
			registerForSave()
		}
	}
	
	var totalTime = 0.0 {
		didSet {
			userDefaults.setValue(totalTime, forKey: "totalTime")
			registerForSave()
		}
	}
	
	var lastDay = 0 {
		didSet {
			userDefaults.setValue(lastDay, forKey: "lastDay")
			registerForSave()
		}
	}
	
	var numDays = 0 {
		didSet {
			userDefaults.setValue(numDays, forKey: "numDays")
			registerForSave()
		}
	}
	
	var isOutside = true {
		didSet {
			userDefaults.setValue(isOutside, forKey: "isOutside")
			registerForSave()
		}
	}
	
	private static var instance: DataController?
	
	private var pendingSave = false
	private var userDefaults: NSUserDefaults!
	
	public init!() {
		guard DataController.instance == nil else {
			assertionFailure("cannot instantiate more than one object")
			return nil
		}
		
		userDefaults = NSUserDefaults(suiteName: "group.ms.TimeTracker")
		
		reload()
		
		DataController.instance = self
	}
	
	public func reload() {
		timeArrived = userDefaults.valueForKey("timeArrived") as? NSDate
		timeLeft = userDefaults.valueForKey("timeLeft") as? NSDate
		timeForToday = userDefaults.doubleForKey("timeForToday")
		totalTime = userDefaults.doubleForKey("totalTime")// - 5.hours - 35.minutes
		lastDay = userDefaults.integerForKey("lastDay")
		numDays = userDefaults.integerForKey("numDays")
		if userDefaults.valueForKey("isOutside") != nil {
			isOutside = userDefaults.boolForKey("isOutside")
		}
		
		/*totalTime = 0
		lastDay = 1
		numDays = 1*/
	}
	
	public func reset() {
		timeForToday = 0
		totalTime = 0
		numDays = 0
	}
	
	deinit {
		if pendingSave {
			save()
		}
	}
	
	private func registerForSave() {
		guard pendingSave == false else {
			return
		}
		
		pendingSave = true
		NSOperationQueue.mainQueue().addOperationWithBlock(save)
	}
	
	private func save() {
		guard pendingSave else {
			return
		}
		
		if userDefaults.synchronize() == false {
			NSLog("error while synchronizing user defaults!")
		}
		
		pendingSave = false
	}
}
