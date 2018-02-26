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
	var data: DataModel!
	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		data = DataModel(sections: query.collectionSections, collections: query.collections)
		self.tableView.tableFooterView = UIView()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let destinationVC = segue.destination as? PlaylistDetailTableViewController,
			let cell = sender as? PlaylistTableViewCell,
			let playlist = cell.item {
			destinationVC.playlist = playlist
		}
    }
}
