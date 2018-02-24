//
//  RepeatButton.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class RepeatButton: UIButton {
	@IBInspectable
	var currentStateIndex: Int = 0 {
		didSet {
			currentStateIndex %= states.count
			self.setImage(images[currentStateIndex], for: .normal)
			self.tintColor = colors[currentStateIndex]
		}
	}

	private var images: [UIImage] {
		return [#imageLiteral(resourceName: "repeat-off"), #imageLiteral(resourceName: "repeat-off"), #imageLiteral(resourceName: "repeat-on")]
	}

	private var colors: [UIColor] {
		return [.white, .red, .white]
	}

	private var states: [MPMusicRepeatMode] {
		return [.none, .all, .one]
	}

	var currentRepeatMode: MPMusicRepeatMode {
		return states[currentStateIndex]
	}
}
