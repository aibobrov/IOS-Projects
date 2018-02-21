//
//  NoteDateBarButtonItem.swift
//  Notes
//
//  Created by Artem Bobrov on 27.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class NoteDateBarButton: UIButton {
	private let dateStates = [NoteDateState.normal, NoteDateState.created, NoteDateState.changed]
	var currentStateIndex: Int = 0 {
		didSet {
			if currentStateIndex >= dateStates.count {
				currentStateIndex %= dateStates.count
			}
		}
	}

	func setTitle(with date: NSDate) {
		let state = dateStates[currentStateIndex]
		self.setTitle(date.string(with: state), for: .normal)
	}
}
