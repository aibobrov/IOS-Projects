//
//  AlbumInfoHeaderView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumInfoHeaderView: PodcastInfoHeaderView {
	@IBOutlet weak var genreYearLabel: UILabel!

	override weak var item: MPMediaItem? {
		set {
			self.object = newValue
			guard let item = item else { return }
			if let artwork = item.artwork {
				artworkImageView.image = artwork.image(at: artworkImageView.frame.size)
			}
			genreYearLabel.text = item.genreYearFormatted ?? ""
			titleLabel.text = item.albumTitle ?? ""
			subtitleLabel.text = item.albumArtist ?? ""
		}
		get {
			return self.object
		}
	}

}
