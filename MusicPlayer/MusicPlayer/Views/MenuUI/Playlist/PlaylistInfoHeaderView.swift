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

	func setInfo(with item: PlaylistModel?) {
		guard let item = item else { return }
		self.artworkImageView.image = item.image(with: self.artworkImageView.frame.size)
		self.titleLabel.text = item.title ?? ""
	}

	let imageCornerRadius: CGFloat = 3

	override func awakeFromNib() {
		super.awakeFromNib()
		self.artworkImageView.layer.masksToBounds = true
		self.artworkImageView.layer.cornerRadius = imageCornerRadius
		self.artworkImageView.layer.backgroundColor = UIColor.black.cgColor
	}
}
