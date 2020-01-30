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
		
		displayView.autoPinEdge(toSuperviewEdge: .trailing, withInset: defaultSpacing)
        NSLayoutConstraint.activate([
            enterExit.autoPinEdge(toSuperviewMargin: .bottom),
            enterExit.autoAlignAxis(toSuperviewAxis: .vertical)
        ])

	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		
        let bundle = Bundle(for: Self.self)
        let image = UIImage(named: "Enter", in: bundle, compatibleWith: traitCollection)
		enterExit.setImage(image!.withRenderingMode(.alwaysTemplate), for: .normal)
		enterExit.tintColor = UIColor.green
	}
}
