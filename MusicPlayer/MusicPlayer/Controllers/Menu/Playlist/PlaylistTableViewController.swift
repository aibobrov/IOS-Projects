//
//  PlaylistTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
	var tableViewCellIdentifier: String {
		return "PlaylistTableViewCellIdentifier"
	}

	let query = MediaModelController.shared.playlistQuery
	var data: DataCollectionModel!
	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		data = DataCollectionModel(sections: query.collectionSections, collections: query.collections)
		self.tableView.tableFooterView = UIView()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destinationVC = segue.destination as? PlaylistDetailTableViewController,
			let cell = sender as? PlaylistTableViewCell,
			let indexPath = tableView.indexPath(for: cell),
			let collection = data.collections?[indexPath.row] {
			destinationVC.playlist = PlaylistModel(title: collection.playlistTitle, collection: collection)
		}
    }
}
