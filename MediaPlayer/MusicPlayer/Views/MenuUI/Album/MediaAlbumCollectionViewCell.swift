//
//  MediaAlbumCollectionViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaAlbumCollectionViewCell: MediaItemCollectionViewCell {
	override weak var item: MPMediaItem? {
		set {
			self.object = newValue
			guard let item = item else { return }
			if let artwork = item.artwork {
				artworkImageView.image = artwork.image(at: artworkImageView.frame.size)
			}

			titleLabel.text = item.albumTitle ?? ""
			subtitleLabel.text = item.albumArtist ?? ""
		}
		get {
			return self.object
		}
	}

	var album: MPMediaItemCollection?
}