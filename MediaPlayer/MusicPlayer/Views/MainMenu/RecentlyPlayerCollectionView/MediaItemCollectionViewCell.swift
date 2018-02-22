//
//  MediaItemCollectionViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 04.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaItemCollectionViewCell: UICollectionViewCell {

	static let cellTextViewsHeight: CGFloat = 35

	@IBOutlet weak var albumArtworkImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var artistAlbumNameLabel: UILabel!

	let imageCornerRadius: CGFloat = 7

	weak var item: MPMediaItem? {
		didSet {
			guard let item = item else { return }
			if let artwork = item.artwork {
				albumArtworkImageView.image = artwork.image(at: albumArtworkImageView.frame.size)
			}

			titleLabel.text = item.title ?? ""
			artistAlbumNameLabel.text = item.artistAlbumFormatted ?? ""
		}
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		self.albumArtworkImageView.layer.masksToBounds = true
		self.albumArtworkImageView.layer.cornerRadius = imageCornerRadius
		self.albumArtworkImageView.layer.backgroundColor = UIColor.black.cgColor
	}

	func onClickAnimation() {
		self.albumArtworkImageView.layer.opacity = 0.5
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.albumArtworkImageView.layer.opacity = 1
		}
	}
}

