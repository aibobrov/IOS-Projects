//
//  PlayerViewControllerPlayerActions.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer
import UIKit


extension PlayerViewController {

	func play() {
		self.player.play()
	}

	func pause() {
		self.player.pause()
	}

	func forward() {
		self.player.skipToNextItem()
	}
}
