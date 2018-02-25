//
//  AlbumInfoHeaderView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumInfoHeaderView: UIView {
	@IBOutlet weak var artworkImageView: UIImageView!
	@IBOutlet weak var genreYearLabel: UILabel!
	@IBOutlet weak var artistLabel: UILabel!
	@IBOutlet weak var albumLabel: UILabel!

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
			genreYearLabel.text = item.genreYearFormatted ?? ""
			albumLabel.text = item.albumTitle ?? ""
			artistLabel.text = item.albumArtist ?? ""
		}
		get {
			return self.object
		}
	}

}
