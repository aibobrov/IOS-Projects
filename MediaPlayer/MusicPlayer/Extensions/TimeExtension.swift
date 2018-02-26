//
//  TimeExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 18.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation

extension TimeInterval {
	var time: (Int, Int) {
		let minutes: Int = Int(self / 60.0)
		let seconds: Int = Int(self.truncatingRemainder(dividingBy: 60.0))

		return (minutes, seconds)
	}

	var timeString: String {
		let time = self.time
		return "\(time.0.formatted):\(time.1.formatted)"
	}
}

extension Int {
	var formatted: String {
		return 0...9 ~= self  ? "0\(self)" : "\(self)"
	}
}

extension Date {
	var year: Int {
		let calendar = Calendar(identifier: .gregorian)
		return calendar.component(.year, from: self)
	}
}

