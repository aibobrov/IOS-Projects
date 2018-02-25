//
//  ArtistTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class ArtistTableViewController: UITableViewController {
	static let ArtistTableViewCellIdentifier = "ArtistTableViewCellIdentifier"

	let query = MediaModelController.shared.artistsQuery

    override func viewDidLoad() {
        super.viewDidLoad()
		
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    	if let destinationVC = segue.destination as? AlbumCollectionViewController,
			let cell = sender as? ArtistTableViewCell, let item = cell.item {
			destinationVC.query = MediaModelController.shared.albumsQuery(for: item.albumArtistPersistentID)
		}
    }
}
