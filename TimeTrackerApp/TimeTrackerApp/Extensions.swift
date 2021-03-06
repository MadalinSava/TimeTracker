//
//  Extensions.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 06/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import Foundation

extension Int {
	var d: TimeInterval {
		return TimeInterval(self) * 24.h
	}
	
	var h: TimeInterval {
		return TimeInterval(self) * 60.m
	}
	
	var m: TimeInterval {
		return TimeInterval(self) * 60
	}
}

//func % (type: CVarArgType, format: String) -> String {
//	return NSString(format: "%" + format, type) as String
//}
