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

	internal weak var object: MPMediaItem?

	weak var item: MPMediaItem? {
		set {
			object = newValue
			guard let item = item else { return }
			titleLabel.text = item.title ?? ""
			subtitleLabel.text = "\(item.albumTrackNumber)"
		}
		get {
			return object
		}
	}
}
