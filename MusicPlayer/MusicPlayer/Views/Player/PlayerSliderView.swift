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

	func setCurrent(_ time: TimeInterval?) {
		currentPlaybackTimeLabel.text = time?.timeString ?? "--:--"
	}

	var progress: Float {
		set {
			playbackSlider.value = newValue
		}
		get {
			return playbackSlider.value
		}
	}

	func setDuration(_ time: TimeInterval?) {
		durationTimeLabel.text = time?.timeString ?? "--:--"
	}

	
}
