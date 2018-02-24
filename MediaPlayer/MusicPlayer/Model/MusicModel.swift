//
//  MusicModel.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 21.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer

typealias Songlist = [MPMediaItemCollection]

class MediaModelController {
	private init() {}

	static let shared = MediaModelController()

	private var noCloudPredicate: MPMediaPropertyPredicate {
		return MPMediaPropertyPredicate(value: false, forProperty: MPMediaItemPropertyIsCloudItem, comparisonType: .equalTo)
	}

	var albumsQuery: MPMediaQuery {
		let query = MPMediaQuery.albums()
		query.addFilterPredicate(noCloudPredicate)
		return query
	}

	var songsQuery: MPMediaQuery {
		let query = MPMediaQuery.songs()
		query.addFilterPredicate(noCloudPredicate)
		query.groupingType = .albumArtist
		return query
	}

	func recentSongs(for maxAmount: Int) -> [MPMediaItem]? {
		guard let list = songsQuery.items?.filter({$0.hasLastPlayedDate}) else { return nil }
		return Array(list.sorted { (lhs, rhs) -> Bool in
			return lhs.lastPlayedDate!.compare(rhs.lastPlayedDate!) == .orderedDescending
			}.prefix(maxAmount))
	}
}
