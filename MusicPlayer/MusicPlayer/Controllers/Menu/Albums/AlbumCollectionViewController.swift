//
//  AlbumCollectionViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumCollectionViewController: UICollectionViewController {
	var collectionViewReusabeIdentifier: String {
		return "AlbumCollectionViewCellIdentifier"
	}
	var albumCollectionViewReusableViewIdentifier: String {
		return "AlbumCollectionViewReusableViewIdentifier"
	}
	
	var query = MediaModelController.shared.albumsQuery
	var data: DataCollectionModel!
	override func viewDidLoad() {
		super.viewDidLoad()
		data = DataCollectionModel(sections: query.collectionSections, collections: query.collections)
	}

	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destinationVC = segue.destination as? AlbumDetailTableViewController,
			let cell = sender as? MediaAlbumCollectionViewCell,
			let indexPath = collectionView?.indexPath(for: cell),
			let album = data.collection(for: indexPath) {
			destinationVC.album = album
		}
	}
}
