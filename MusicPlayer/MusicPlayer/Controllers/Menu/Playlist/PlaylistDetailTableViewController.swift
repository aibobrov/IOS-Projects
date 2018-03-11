//
//  PlaylistDetailTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class PlaylistDetailTableViewController: TableViewWithMusicPlayerBarTableViewController {
	var tableViewReusableIdentidier: String {
		return "SongTableViewCellIdentidier"
	}

	@IBOutlet weak var playlistHeaderView: PlaylistInfoHeaderView!

	var playlist: PlaylistModel!
	
	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		self.tableView.tableFooterView = UIView()
		self.playlistHeaderView.artworkImageView.image = playlist.image(with: self.playlistHeaderView.artworkImageView.frame.size)
		self.playlistHeaderView.titleLabel.text = playlist.title ?? ""
    }
}
