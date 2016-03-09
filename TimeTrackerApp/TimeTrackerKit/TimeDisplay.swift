//
//  TimeDisplay.swift
//  TimeTrackerApp
//
//  Created by Madalin Sava on 13/01/16.
//  Copyright © 2016 Madalin Sava. All rights reserved.
//

import UIKit
import PureLayout

public class TimeDisplay: UIView {

	public var time: UILabel!
	
	var text: UILabel!
	
	init(name: String, textColor: UIColor) {
		super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
		
		translatesAutoresizingMaskIntoConstraints = false
		
		text = newLabel(textColor)
		text.text = name
		
		time = newLabel(textColor)
		time.text = "HH:mm"
		time.textAlignment = .Right
		
		text.autoPinEdgeToSuperviewEdge(.Top)
		text.autoPinEdgeToSuperviewEdge(.Leading)
		text.autoPinEdgeToSuperviewEdge(.Bottom)
		
		time.autoPinEdgeToSuperviewEdge(.Top)
		time.autoPinEdgeToSuperviewEdge(.Trailing)
		time.autoPinEdgeToSuperviewEdge(.Bottom)
		
		//time.autoPinEdge(.Leading, toEdge: .Trailing, ofView: text)
	}

	required public init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	private func newLabel(color: UIColor) -> UILabel {
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.font = UIFont.systemFontOfSize(20)
		label.textColor = color
		label.translatesAutoresizingMaskIntoConstraints = false
		addSubview(label)
		
		return label
	}
}
