//
//  AlbumTableViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumTableViewCell: SelectedTableViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	
	let imageCornerRadius: CGFloat = 7

	override func awakeFromNib() {
		super.awakeFromNib()

		self.imageView?.layer.masksToBounds = true
		self.imageView?.layer.cornerRadius = imageCornerRadius
		self.imageView?.layer.backgroundColor = UIColor.black.cgColor
	}

	weak var item: MPMediaItem? {
		didSet {
			guard let item = item else { return }
			if let title = item.title {
				titleLabel.text = title
			}
			
			subtitleLabel.text = "\(item.albumTrackNumber)"
		}
	}


}
