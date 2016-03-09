//
//  AppView.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 10/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit

import TimeTrackerKit

@IBDesignable
class AppView: BaseView {
	
	override func setupUI() {
		setupTimeDisplay()
		
		displayView.autoPinEdgeToSuperviewEdge(.Trailing, withInset: defaultSpacing)
		
		enterExit.autoPinEdgeToSuperviewMargin(.Bottom)
		enterExit.autoAlignAxisToSuperviewAxis(.Vertical)
		
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		
		let bundle = NSBundle(forClass: self.dynamicType)
		let image = UIImage(named: "Enter", inBundle: bundle, compatibleWithTraitCollection: self.traitCollection)
		enterExit.setImage(image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: .Normal)
		enterExit.tintColor = UIColor.greenColor()
	}
}
