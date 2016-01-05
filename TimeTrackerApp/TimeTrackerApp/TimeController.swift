//
//  TimeController.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import Foundation

class TimeController {
	
	var dataController: PDataController!
	
	
	func enter() {
		
	}
	
	func exit() {
		
	}
	
	func getFullTime() -> NSDate {
		let now = NSDate()
		return now.dateByAddingTimeInterval(8*60*60)
	}
	
	init() {
		
	}
}
