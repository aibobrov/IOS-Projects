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
	var image: UIImage = UIImage()
	var title: String?
	var collection: MPMediaItemCollection

	init(title: String?, collection: MPMediaItemCollection) {
		self.title = title
		self.collection = collection
	}
}
