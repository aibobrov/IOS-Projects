//
//  PlayerViewControllerActions.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension PlayerViewController {
	@objc func playPausePopupItemClicked(_ sender: PlayerActionButton) {
		sender.onClickAnimation()
		if player.isPlaying {
			self.pause()
		} else {
			self.play()
		}
	}

	@objc func forwardPopupItemClicked(_ sender: PlayerActionButton) {
		sender.onClickAnimation()
		self.forward()
	}
}
