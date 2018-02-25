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
		let insets = navigationController?.popupBar.frame.size.height ?? 0
		self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: insets, right: 0)
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		playerViewController.player.prepareToPlay()
	}
}
