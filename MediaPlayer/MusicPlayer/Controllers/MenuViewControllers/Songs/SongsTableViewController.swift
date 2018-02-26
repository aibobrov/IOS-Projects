//
//  SongsTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class SongsTableViewController: TableViewWithMusicPlayerBarTableViewController {

	var tableViewReusableIdentidier: String {
		return "SongTableViewCellIdentidier"
	}

	var query = MediaModelController.shared.songsQuery
	var data: DataModel!

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		data = DataModel(sections: query.itemSections, collections: [MPMediaItemCollection(items: query.items ?? [])])
		self.tableView.tableFooterView = UIView()
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		playerViewController.player.prepareToPlay()
	}
}
