//
//  ProgressTimer.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation

class ProgressTimer {
	init(with interval: TimeInterval, action: @escaping ((Timer) -> Void) = {_ in }) {
		self.interval = interval
		self.action = action
	}

	private var timer: Timer? = nil

	var action: ((Timer) -> Void)
	var interval: TimeInterval

	func start() {
		timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true, block: action)
	}

	func stop() {
		timer?.invalidate()
		timer = nil
	}
}
