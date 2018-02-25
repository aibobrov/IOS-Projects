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
	static let AlbumDetailTableViewControllerCellIdentifier = "AlbumDetailTableViewControllerCellIdentifier"

	@IBOutlet weak var headerView: AlbumInfoHeaderView!

	weak var album: MPMediaItemCollection?

	override func viewDidLoad() {
        super.viewDidLoad()
		if let item = album?.items.first {
			headerView.item = item
		}
    }
}
