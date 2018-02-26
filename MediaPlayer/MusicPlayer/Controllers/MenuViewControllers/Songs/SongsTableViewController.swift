//
//  SongsTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class SongsTableViewController: TableViewWithMusicPlayerBarTableViewController {

	static let SongTableViewCellIdentidier = "SongTableViewCellIdentidier"

	lazy var query = MediaModelController.shared.songsQuery


	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.tableFooterView = UIView()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		playerViewController.player.prepareToPlay()
	}
}
