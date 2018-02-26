//
//  ArtistTableViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class ArtistTableViewCell: MediaTableViewCell {
	override lazy var imageCornerRadius: CGFloat = self.artworkImageView.frame.height / 2

	override weak var item: MPMediaItem? {
		set {
			self.object = newValue
			guard let item = item else { return }
			self.titleLabel.text = item.albumArtist ?? ""
			self.artworkImageView.image = item.artwork?.image(at: artworkImageView.frame.size)
		}
		get {
			return self.object
		}
	}

}
