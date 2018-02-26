//
//  PlaylistTableViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistTableViewCell: SelectedTableViewCell {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var artworksImageView: UIImageView!

	internal var object: PlaylistModel?

	var item: PlaylistModel? {
		set {
			object = newValue
			guard let item = item else { return }
			titleLabel.text = item.title
			artworksImageView.image = item.image
		}
		get {
			return object
		}
	}

	lazy var imageCornerRadius: CGFloat = 3

	override func awakeFromNib() {
		super.awakeFromNib()
		self.artworksImageView.layer.masksToBounds = true
		self.artworksImageView.layer.cornerRadius = imageCornerRadius
		self.artworksImageView.layer.backgroundColor = UIColor.black.cgColor
	}

}

