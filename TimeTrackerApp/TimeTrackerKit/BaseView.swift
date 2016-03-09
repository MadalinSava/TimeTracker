//
//  BaseView.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 10/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit
import PureLayout

public let defaultSpacing: CGFloat = 8.0

public class BaseView: UIView {
	
	@IBInspectable var textColor: UIColor!
	
	public var displayView: UIView!
	public var fullTimeView: TimeDisplay!
	public var regularTimeView: TimeDisplay!
	public var prevBalanceView: TimeDisplay!
	public var currentBalanceView: TimeDisplay!
	public var enterExit: UIButton!
	
	var viewController: UIViewController!
	
	override public func prepareForInterfaceBuilder() {
		setupUI()
	}
	
	public func setupUI() {
		assertionFailure()
	}
	
	public func setupTimeDisplay() {
		//backgroundColor = UIColor.brownColor()
		
		displayView = UIView()
		addSubview(displayView)
		
		if viewController != nil {
			displayView.autoPinToTopLayoutGuideOfViewController(viewController, withInset: defaultSpacing)
		} else {
			displayView.autoPinEdgeToSuperviewEdge(.Top, withInset: defaultSpacing)// +20
		}
		displayView.autoPinEdgeToSuperviewEdge(.Leading, withInset: defaultSpacing)
		
		fullTimeView = TimeDisplay(name: "Full time", textColor: textColor)
		displayView.addSubview(fullTimeView)
		fullTimeView.autoPinEdgeToSuperviewEdge(.Top)
		fullTimeView.autoPinEdgeToSuperviewEdge(.Leading)
		fullTimeView.autoPinEdgeToSuperviewEdge(.Trailing)
		
		regularTimeView = TimeDisplay(name: "Regular time", textColor: textColor)
		displayView.addSubview(regularTimeView)
		regularTimeView.autoPinEdge(.Top, toEdge: .Bottom, ofView: fullTimeView, withOffset: defaultSpacing)
		regularTimeView.autoPinEdgeToSuperviewEdge(.Leading)
		regularTimeView.autoPinEdgeToSuperviewEdge(.Trailing)
		
		prevBalanceView = TimeDisplay(name: "Previous balance", textColor: textColor)
		displayView.addSubview(prevBalanceView)
		prevBalanceView.autoPinEdge(.Top, toEdge: .Bottom, ofView: regularTimeView, withOffset: defaultSpacing)
		prevBalanceView.autoPinEdgeToSuperviewEdge(.Leading)
		prevBalanceView.autoPinEdgeToSuperviewEdge(.Trailing)
		
		currentBalanceView = TimeDisplay(name: "Current balance", textColor: textColor)
		displayView.addSubview(currentBalanceView)
		currentBalanceView.autoPinEdge(.Top, toEdge: .Bottom, ofView: prevBalanceView, withOffset: defaultSpacing)
		currentBalanceView.autoPinEdgeToSuperviewEdge(.Leading)
		currentBalanceView.autoPinEdgeToSuperviewEdge(.Trailing)
		
		currentBalanceView.autoPinEdgeToSuperviewEdge(.Bottom)
		
		enterExit = UIButton()
		addSubview(enterExit)
	}
}
