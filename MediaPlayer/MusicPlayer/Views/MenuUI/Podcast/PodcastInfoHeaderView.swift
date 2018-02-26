//
//  PodcastInfoHeaderView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class PodcastInfoHeaderView: UIView {
	@IBOutlet weak var artworkImageView: UIImageView!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!

	let imageCornerRadius: CGFloat = 7

	override func awakeFromNib() {
		super.awakeFromNib()
		self.artworkImageView.layer.masksToBounds = true
		self.artworkImageView.layer.cornerRadius = imageCornerRadius
		self.artworkImageView.layer.backgroundColor = UIColor.black.cgColor
	}

	internal weak var object: MPMediaItem?

	weak var item: MPMediaItem? {
		set {
			self.object = newValue
			guard let item = item else { return }
			if let artwork = item.artwork {
				artworkImageView.image = artwork.image(at: artworkImageView.frame.size)
			}
			titleLabel.text = item.podcastTitle ?? ""
			subtitleLabel.text = item.artist ?? ""
		}
		get {
			return self.object
		}
	}
}
