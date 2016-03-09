//
// Created by Madalin Sava on 23/01/16.
// Copyright (c) 2016 Madalin Sava. All rights reserved.
//

import Foundation

typealias SimpleBlock = () -> Void

class Notification {
	private var selector: SimpleBlock

	init(selector: SimpleBlock) {
		self.selector = selector
	}

	private func select() {
		selector()
	}
}

class NotificationHelper {
	static let instance = NotificationHelper()

	func addObserver(block: SimpleBlock, forNotification notification: String, withObject object: AnyObject? = nil) {
		let notif = Notification(selector: block)
		NSNotificationCenter.defaultCenter().addObserver(notif, selector: "select:", name: notification, object: object)
	}

	func removeObserver() {
		//NSNotificationCenter.defaultCenter().removeObserver()
	}
}
