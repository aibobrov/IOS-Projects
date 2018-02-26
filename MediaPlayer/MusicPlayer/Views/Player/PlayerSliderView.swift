//
//  PlayerSliderView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class PlayerSliderView: UIView {
	@IBOutlet weak var currentPlaybackTimeLabel: UILabel!
	@IBOutlet weak var durationTimeLabel: UILabel!
	@IBOutlet weak var playbackSlider: SeekPlayerSlider!

	private var current: TimeInterval?
	private var duration: TimeInterval?

	var currentTime: TimeInterval? {
		set {
			current = newValue
			currentPlaybackTimeLabel.text = current?.timeString ?? "--:--"
			if let duration = duration, let current = current, duration != 0 {
				let progress = current / duration
				playbackSlider.value = Float(progress)
			}
		}
		get {
			return self.current
		}
	}

	var durationTime: TimeInterval? {
		set {
			duration = newValue
			durationTimeLabel.text = duration?.timeString ?? "--:--"
		}
		get {
			return self.duration
		}
	}




	
}
