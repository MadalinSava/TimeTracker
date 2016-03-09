//
//  TodayViewController.swift
//  TimeTrackerToday
//
//  Created by Madalin Sava on 06/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit
import NotificationCenter
import TimeTrackerKit

class TodayViewController: TimeTrackerViewController, NCWidgetProviding {
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		NSLog("setting content size")
		//preferredContentSize = view.frame.size
		
		print(view.frame, view.superview!.frame, (view as! BaseView).displayView.frame)
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		print(view.frame, view.superview!.frame, (view as! BaseView).displayView.frame)
	}
	
	func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
		return UIEdgeInsetsZero
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		
		//preferredContentSize = CGSize(width: 0, height: 100)
	}
	
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
		
        completionHandler(NCUpdateResult.NewData)
    }
    
}
