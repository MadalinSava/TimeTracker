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
	var timeArrived: Date! {get set}
	var timeLeft: Date! {get set}
	var timeForToday: TimeInterval {get set}
	var totalTime: TimeInterval {get set}
	var lastDay: Int {get set}
	var numDays: Int {get set}
	var isOutside: Bool {get set}
	
	func reload()
	func reset()
}

public class DataController: PDataControllerInternal {
	
	var timeArrived: Date! {
		didSet {
			userDefaults.setValue(timeArrived, forKey: "timeArrived")
			registerForSave()
		}
	}
	
	var timeLeft: Date! {
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
	private var userDefaults: UserDefaults!
	
	public init!() {
		guard DataController.instance == nil else {
			assertionFailure("cannot instantiate more than one object")
			return nil
		}
		
		userDefaults = UserDefaults(suiteName: "group.ms.TimeTracker")
		
		reload()
		
		DataController.instance = self
	}
	
	public func reload() {
        timeArrived = userDefaults.value(forKey: "timeArrived") as? Date
		timeLeft = userDefaults.value(forKey: "timeLeft") as? Date
		timeForToday = userDefaults.double(forKey: "timeForToday")
		totalTime = userDefaults.double(forKey: "totalTime")// - 5.hours - 35.minutes
		lastDay = userDefaults.integer(forKey: "lastDay")
		numDays = userDefaults.integer(forKey: "numDays")
		if userDefaults.value(forKey: "isOutside") != nil {
			isOutside = userDefaults.bool(forKey: "isOutside")
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
        OperationQueue.main.addOperation(save)
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
