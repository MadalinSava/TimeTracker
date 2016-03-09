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
		
		displayView.autoPinEdgeToSuperviewEdge(.Bottom, withInset: defaultSpacing)
		displayView.autoPinEdge(.Trailing, toEdge: .Leading, ofView: enterExit, withOffset: -defaultSpacing)
		
		enterExit.autoPinEdgeToSuperviewEdge(.Trailing, withInset: defaultSpacing)
		enterExit.autoAlignAxisToSuperviewAxis(.Horizontal)
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		
		let bundle = NSBundle(forClass: self.dynamicType)
		let image = UIImage(named: "Enter", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
		enterExit.setImage(image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: .Normal)
		enterExit.tintColor = UIColor.greenColor()
	}
}
