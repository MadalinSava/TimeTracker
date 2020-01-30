//
//  TimeTrackerViewController.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 10/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit

open class TimeTrackerViewController: UIViewController {
	
	private var timeController: TimeController!
	private let formatter = DateFormatter()
	
	private lazy var baseView: BaseView = { return self.view as! BaseView }()
	
	override open func viewDidLoad() {
		super.viewDidLoad()
		
		timeController = TimeController(dataControllerAbstract: DataController(), timeProviderAbstract: TimeProvider())
		
		formatter.dateFormat = "HH:mm"
		
		baseView.viewController = self
		baseView.setupUI()
		
        baseView.enterExit.addTarget(self, action: #selector(toggleState), for: .touchUpInside)
	}
	
	override open func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		setup()
	}
	
	override open func viewDidAppear(_ animated: Bool) {
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

	override open func prepareForInterfaceBuilder() {

	}

	public func setup() {
		timeController.reloadData()
		if timeController.isOutside {
			setupOutside()
		} else {
			setupInside()
		}
	}
	
	@IBAction func toggleState() {
		if timeController.isOutside {
			timeController.enter()
			setupInside()
		} else {
			timeController.exit()
			setupOutside()
		}
	}
	
	private func setupInside() {
		baseView.fullTimeView.time.text = formatDate(timeController.getFullTime())
		baseView.regularTimeView.time.text = formatDate(timeController.getRegularTime())
		baseView.prevBalanceView.time.text = formatTime(timeController.prevBalance)
		baseView.currentBalanceView.time.text = formatTime(timeController.getTodayBalance())
		
		baseView.enterExit.setImage(UIImage(named: "Exit")!.withRenderingMode(.alwaysTemplate), for: .normal)
		baseView.enterExit.tintColor = UIColor.red
	}
	
	private func setupOutside() {
		baseView.fullTimeView.time.text = "--:--"
		baseView.regularTimeView.time.text = "--:--"
		baseView.prevBalanceView.time.text = "--:--"
		baseView.currentBalanceView.time.text = formatTime(timeController.getTodayBalance())
		
		baseView.enterExit.setImage(UIImage(named: "Enter")!.withRenderingMode(.alwaysTemplate), for: .normal)
		baseView.enterExit.tintColor = UIColor.green
	}
	
	private func formatDate(_ date: Date) -> String {
        return formatter.string(from: date)
	}
	
	private func formatTime(_ seconds: TimeInterval) -> String {
		let minutes = Int(seconds) / 60
		return String(minutes / 60) + ":" + (NSString(format:"%02d", abs(minutes) % 60) as String)
	}
}
