//
//  MediaTableViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaTableViewCell: AlbumTableViewCell {

	@IBOutlet weak var artworkImageView: UIImageView!

	lazy var imageCornerRadius: CGFloat = 7

	override func awakeFromNib() {
		super.awakeFromNib()
		self.artworkImageView.layer.masksToBounds = true
		self.artworkImageView.layer.cornerRadius = imageCornerRadius
		self.artworkImageView.layer.backgroundColor = UIColor.black.cgColor
	}

	override weak var item: MPMediaItem? {
		set {
			self.object = newValue
			guard let item = item else { return }
			if let artwork = item.artwork {
				artworkImageView.image = artwork.image(at: artworkImageView.frame.size)
			}

			self.titleLabel.text = item.title ?? ""
			subtitleLabel.text = item.albumArtist ?? ""
		}
		get {
			return self.object
		}
	}


}
