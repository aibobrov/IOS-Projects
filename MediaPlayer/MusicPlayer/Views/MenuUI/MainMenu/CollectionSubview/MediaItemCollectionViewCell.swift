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

	@IBOutlet weak var artworkImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!

	let imageCornerRadius: CGFloat = 7

	internal weak var object: MPMediaItem?

	weak var item: MPMediaItem? {
		set {
			self.object = newValue
			guard let item = item else { return }
			if let artwork = item.artwork {
				artworkImageView.image = artwork.image(at: artworkImageView.frame.size)
			}

			titleLabel.text = item.title ?? ""
			subtitleLabel.text = item.artistAlbumFormatted ?? ""
		}
		get {
			return self.object
		}
	}

	override func awakeFromNib() {
		super.awakeFromNib()
		self.artworkImageView.layer.masksToBounds = true
		self.artworkImageView.layer.cornerRadius = imageCornerRadius
		self.artworkImageView.layer.backgroundColor = UIColor.black.cgColor
	}

	func onClickAnimation() {
		self.artworkImageView.layer.opacity = 0.5
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
			self.artworkImageView.layer.opacity = 1
		}
	}
}

