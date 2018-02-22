//
//  PlayerActionButton.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 06.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class PlayerActionButton: UIButton {
	var alternativeImage: UIImage?

	override func updateConstraints() {
		super.updateConstraints()
		layer.backgroundColor = UIColor.gray.withAlphaComponent(0).cgColor
		layer.cornerRadius = frame.height / 2

		self.contentEdgeInsets = UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0)
	}

	func onClickAnimation() {
		let duration: TimeInterval = 0.5
		self.layer.backgroundColor = self.layer.backgroundColor?.copy(alpha: 0)

		DispatchQueue.main.async {
			UIView.animate(withDuration: duration, animations: {
				self.imageView?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
				self.layer.backgroundColor = self.layer.backgroundColor?.copy(alpha: 0.5)
			})
			UIView.animate(withDuration: duration, animations: {
				self.imageView?.transform = .identity
				self.layer.backgroundColor = self.layer.backgroundColor?.copy(alpha: 0)
			})
		}
	}

	func switchImages() {
		if let newImage = self.alternativeImage {
			alternativeImage = imageView?.image
			self.setImage(newImage, for: .normal)
		}
	}
}
