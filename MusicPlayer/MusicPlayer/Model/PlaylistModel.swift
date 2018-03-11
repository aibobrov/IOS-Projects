//
//  PlaylistModel.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

struct PlaylistModel {
	var title: String?
	var collection: MPMediaItemCollection

	init(title: String?, collection: MPMediaItemCollection) {
		self.title = title
		self.collection = collection
	}

	func image(with size: CGSize) -> UIImage {
		if let collage = collection.playlistCollage(for: 4, with: size) {
			return collage
		} else if collection.count > 0,
			let artwork = collection.representativeItem?.artwork?.image(at: size) {
			return artwork
		}

		return UIImage(color: .clear, size: size)
	}
}
