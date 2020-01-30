//
// Created by Madalin Sava on 23/01/16.
// Copyright (c) 2016 Madalin Sava. All rights reserved.
//

import Foundation

typealias SimpleBlock = () -> Void

class Notification {
	private var selector: SimpleBlock

	init(selector: @escaping SimpleBlock) {
		self.selector = selector
	}

    @objc fileprivate func select() {
		selector()
	}
}

class NotificationHelper {
	static let instance = NotificationHelper()

	func addObserver(block: @escaping SimpleBlock, forNotification notification: String, withObject object: AnyObject? = nil) {
		let notif = Notification(selector: block)
        NotificationCenter.default.addObserver(notif, selector: #selector(Notification.select), name: NSNotification.Name(rawValue: notification), object: object)
	}

	func removeObserver() {
		//NSNotificationCenter.defaultCenter().removeObserver()
	}
}
