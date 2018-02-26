//
//  MediaPodcastCollectionViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaPodcastCollectionViewCell: MediaAlbumCollectionViewCell {
	override weak var item: MPMediaItem? {
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
