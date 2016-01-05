//
//  DataController.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import Foundation

protocol PDataController {
	var timeArrived: NSTimeInterval {get set}
	var timeLeft: NSTimeInterval {get set}
	var timeForToday: NSTimeInterval {get set}
	var totalTime: NSTimeInterval {get set}
	var lastDay: Int {get set}
	var numDays: Int {get set}
}

class DataController: PDataController {
	
	var timeArrived = 0.0 {
		didSet {
			registerForSave()
		}
	}
	
	var timeLeft = 0.0 {
		didSet {
			registerForSave()
		}
	}
	
	var timeForToday = 0.0 {
		didSet {
			registerForSave()
		}
	}
	
	var totalTime = 0.0 {
		didSet {
			registerForSave()
		}
	}
	
	var lastDay = 0 {
		didSet {
			registerForSave()
		}
	}
	
	var numDays = 0 {
		didSet {
			registerForSave()
		}
	}
	
	init() {
		
	}
	
	deinit {
		if unsaved {
			save()
		}
	}
	
	private func registerForSave() {
		guard unsaved == false else {
			return
		}
	}
}
