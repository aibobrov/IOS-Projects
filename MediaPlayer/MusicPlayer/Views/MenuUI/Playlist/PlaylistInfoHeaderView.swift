//
//  PlaylistInfoHeaderView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistInfoHeaderView: UIView {
	@IBOutlet weak var artworkImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	
	internal var object: PlaylistModel?

	var item: PlaylistModel? {
		set {
			self.object = newValue
			guard let item = item else { return }
			self.artworkImageView.image = item.image
			self.titleLabel.text = item.title ?? ""
		}
		get {
			return self.object
		}
	}

	let imageCornerRadius: CGFloat = 3

	override func awakeFromNib() {
		super.awakeFromNib()
		self.artworkImageView.layer.masksToBounds = true
		self.artworkImageView.layer.cornerRadius = imageCornerRadius
		self.artworkImageView.layer.backgroundColor = UIColor.black.cgColor
	}
}
