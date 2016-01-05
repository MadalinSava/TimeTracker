//
//  ViewController.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 05/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var fullTimeText: UILabel!
	@IBOutlet var fullTimeHour: UILabel!
	
	@IBOutlet var regularTimeText: UILabel!
	@IBOutlet var regularTimeHour: UILabel!
	
	@IBOutlet var prevBalanceText: UILabel!
	@IBOutlet var prevBalanceHour: UILabel!
	
	@IBOutlet var todayBalanceText: UILabel!
	@IBOutlet var todayBalanceHour: UILabel!
	
	@IBOutlet var prevBalanceTextInside: NSLayoutConstraint!
	@IBOutlet var prevBalanceHourInside: NSLayoutConstraint!
	
	@IBOutlet var prevBalanceTextOutside: NSLayoutConstraint!
	@IBOutlet var prevBalanceHourOutside: NSLayoutConstraint!
	
	private var timeController: TimeController!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		timeController = TimeController()
		timeController.dataController = DataController()
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		todayBalanceHour.text = "wow dude"
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		/*
		self.prevBalanceTextInside.active = !self.prevBalanceTextInside.active
		self.prevBalanceTextOutside.active = !self.prevBalanceTextOutside.active
		
		UIView.animateWithDuration(2.0, animations: { [unowned self] in
			
			self.fullTimeHour.alpha = 1 - self.fullTimeHour.alpha
			
			self.view.layoutIfNeeded()
			
			}, completion: { [unowned self] completed in
				self.fullTimeHour.alpha = 1 - self.fullTimeHour.alpha
				self.fullTimeHour.hidden = !self.fullTimeHour.hidden
		})*/
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
