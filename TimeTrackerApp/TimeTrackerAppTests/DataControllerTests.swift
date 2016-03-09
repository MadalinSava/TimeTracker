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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
	
	func testPersistency() {
		let arrived = NSDate()//.timeIntervalSince1970
		
		var dc: DataController! = DataController()
		dc.timeArrived = arrived
		
		//dc = nil
		dc = DataController()
		
		//let expectation = expectationWithDescription("sync")
		
		/*dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(Double(NSEC_PER_SEC) * 0.5)), dispatch_get_main_queue()) { () -> Void in
			expectation.fulfill()
		}*/
		
		/*waitForExpectationsWithTimeout(1.0) { error in
			
		}*/
		XCTAssertEqual(dc.timeArrived, arrived)
	}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
