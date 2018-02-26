//
//  DataModel.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer

class DataModel {
	var collections: [MPMediaItemCollection]?
	var sections: [MPMediaQuerySection]?
	init(sections: [MPMediaQuerySection]?, collections: [MPMediaItemCollection]?) {
		self.collections = collections
		self.sections = sections
	}
}
