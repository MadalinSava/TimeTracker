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

open class BaseView: UIView {
	
	@IBInspectable var textColor: UIColor!
	
	public var displayView: UIView!
	public var fullTimeView: TimeDisplay!
	public var regularTimeView: TimeDisplay!
	public var prevBalanceView: TimeDisplay!
	public var currentBalanceView: TimeDisplay!
	public var enterExit: UIButton!
	
	var viewController: UIViewController!
	
	override open func prepareForInterfaceBuilder() {
		setupUI()
	}
	
	open func setupUI() {
		assertionFailure()
	}
	
	public func setupTimeDisplay() {
		//backgroundColor = UIColor.brown
		
		displayView = UIView()
		addSubview(displayView)
		
		if viewController != nil {
            displayView.autoPin(toTopLayoutGuideOf: viewController, withInset: defaultSpacing)
		} else {
			displayView.autoPinEdge(toSuperviewEdge: .top, withInset: defaultSpacing)// +20
		}
		displayView.autoPinEdge(toSuperviewEdge: .leading, withInset: defaultSpacing)
		
		fullTimeView = TimeDisplay(name: "Full time", textColor: textColor)
		displayView.addSubview(fullTimeView)
		fullTimeView.autoPinEdge(toSuperviewEdge: .top)
		fullTimeView.autoPinEdge(toSuperviewEdge: .leading)
		fullTimeView.autoPinEdge(toSuperviewEdge: .trailing)
		
		regularTimeView = TimeDisplay(name: "Regular time", textColor: textColor)
		displayView.addSubview(regularTimeView)
        regularTimeView.autoPinEdge(.top, to: .bottom, of: fullTimeView, withOffset: defaultSpacing)
		regularTimeView.autoPinEdge(toSuperviewEdge: .leading)
		regularTimeView.autoPinEdge(toSuperviewEdge: .trailing)
		
		prevBalanceView = TimeDisplay(name: "Previous balance", textColor: textColor)
		displayView.addSubview(prevBalanceView)
        prevBalanceView.autoPinEdge(.top, to: .bottom, of: regularTimeView, withOffset: defaultSpacing)
		prevBalanceView.autoPinEdge(toSuperviewEdge: .leading)
		prevBalanceView.autoPinEdge(toSuperviewEdge: .trailing)
		
		currentBalanceView = TimeDisplay(name: "Current balance", textColor: textColor)
		displayView.addSubview(currentBalanceView)
        currentBalanceView.autoPinEdge(.top, to: .bottom, of: prevBalanceView, withOffset: defaultSpacing)
		currentBalanceView.autoPinEdge(toSuperviewEdge: .leading)
		currentBalanceView.autoPinEdge(toSuperviewEdge: .trailing)
		
		currentBalanceView.autoPinEdge(toSuperviewEdge: .bottom)
		
		enterExit = UIButton()
		addSubview(enterExit)
	}
}
