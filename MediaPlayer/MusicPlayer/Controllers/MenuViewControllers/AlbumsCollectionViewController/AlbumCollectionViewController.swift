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
	static let AlbumCollectionViewCellIdentifier = "AlbumCollectionViewCellIdentifier"
	static let AlbumCollectionViewReusableViewIdentifier = "AlbumCollectionViewReusableViewIdentifier"
	
	var query = MediaModelController.shared.albumsQuery

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destinationVC = segue.destination as? AlbumDetailTableViewController,
			let cell = sender as? MediaAlbumCollectionViewCell {
			destinationVC.album = cell.album
		}
	}
}
