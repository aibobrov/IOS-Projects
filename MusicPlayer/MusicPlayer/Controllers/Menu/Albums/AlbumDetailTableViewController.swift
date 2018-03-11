//
//  AlbumDetailTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumDetailTableViewController: TableViewWithMusicPlayerBarTableViewController {
	var detailTableViewControllerReusableIdentifier: String {
		return "AlbumDetailTableViewControllerCellIdentifier"
	}

	@IBOutlet weak var headerView: PodcastInfoHeaderView!

	weak var album: MPMediaItemCollection!

	// MARK: - Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
		headerView.setInfo(with: album?.representativeItem)

		self.tableView.tableFooterView = UIView()
    }
}
