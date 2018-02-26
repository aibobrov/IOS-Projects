//
//  SeekPlayerSlider.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

@IBDesignable
class SeekPlayerSlider: UISlider {

	@IBInspectable
	var normalThumbImage: UIImage? {
		didSet {
			self.setThumbImage(normalThumbImage, for: .normal)
		}
	}

	@IBInspectable
	var highlightedThumbImage: UIImage? {
		didSet {
			self.setThumbImage(highlightedThumbImage, for: .highlighted)
		}
	}
}
