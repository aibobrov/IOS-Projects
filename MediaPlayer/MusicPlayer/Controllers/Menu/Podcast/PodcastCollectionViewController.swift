//
//  PodcastCollectionViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class PodcastCollectionViewController: AlbumCollectionViewController {
	override var collectionViewReusabeIdentifier: String {
		return "PodcastCollectionViewCellIdentifier"
	}

    override func viewDidLoad() {
		let query = MediaModelController.shared.podcastQuery
		data = DataCollectionModel(sections: query.collectionSections, collections: query.collections)
	}
}
