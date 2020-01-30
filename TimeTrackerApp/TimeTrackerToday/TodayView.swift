//
//  TodayView.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 13/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit
import TimeTrackerKit

@IBDesignable
class TodayView: BaseView {
	
	override func setupUI() {
		setupTimeDisplay()
		
		displayView.autoPinEdge(toSuperviewEdge: .bottom, withInset: defaultSpacing)
		displayView.autoPinEdge(.trailing, toEdge: .leading, ofView: enterExit, withOffset: -defaultSpacing)
		
		enterExit.autoPinEdge(toSuperviewEdge: .trailing, withInset: defaultSpacing)
		enterExit.autoAlignAxisToSuperviewAxis(.Horizontal)
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		
		let bundle = NSBundle(forClass: self.dynamicType)
		let image = UIImage(named: "Enter", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
		enterExit.setImage(image!.withRenderingMode(.alwaysTemplate), for: .normal)
		enterExit.tintColor = UIColor.green
	}
}
