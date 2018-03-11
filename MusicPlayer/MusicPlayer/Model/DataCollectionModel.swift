//
//  DataModel.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer

class DataCollectionModel {
	var collections: [MPMediaItemCollection]?
	var sections: [MPMediaQuerySection]?

	init(sections: [MPMediaQuerySection]?, collections: [MPMediaItemCollection]?) {
		self.collections = collections
		self.sections = sections
	}

	func item(for indexPath: IndexPath) -> MPMediaItem? {
		if let range = sections?[indexPath.section].range {
			return collections?[range.location + indexPath.row].representativeItem
		}
		return nil
	}
	func collection(for indexPath: IndexPath) -> MPMediaItemCollection? {
		if let range = sections?[indexPath.section].range {
			return collections?[range.location + indexPath.row]
		}
		return nil
	}
}

class DataCollectionSongsModel: DataCollectionModel {
	override func item(for indexPath: IndexPath) -> MPMediaItem? {
		if let range = sections?[indexPath.section].range {
			let index = range.location + indexPath.row
			return collections?.first?.items[index]
		}
		return nil
	}
}
