//
//  PlaylistTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {
	static let PlaylistTableViewCellIdentifier = "PlaylistTableViewCellIdentifier"

	let query = MediaModelController.shared.playlistQuery

	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
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
