//
//  DataControllerTests.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import XCTest
@testable import TimeTrackerKit

class DataControllerTests: XCTestCase {
	func testPersistency() {
		let arrived = Date()
		var dc: DataController! = DataController()
		dc.timeArrived = arrived
		dc = DataController()
		XCTAssertEqual(dc.timeArrived, arrived)
	}
}
