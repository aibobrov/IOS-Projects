//
//  MainMenuTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 21.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class MainMenuTableViewController: UITableViewController {
	static let RecentMusicHeaderIdentifier = "RecentMusicHeaderIdentifier"
	static let RecentMusicCellIdentifier = "RecentMusicCellIdentifier"

	@IBOutlet weak var recentlyPlayedCollectionView: UICollectionView!

	var recentTracks = [MPMediaItem]()

	// MARK: Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
		AppleMusicPermissionChecker.request { (hasAccess) in
			if hasAccess {
				guard let tracks = MediaModelController.shared.recentSongs(for: 10) else { return }
				self.recentTracks = tracks
				self.recentlyPlayedCollectionView.reloadData()
			}
		}

		recentlyPlayedCollectionView.dataSource = self
		recentlyPlayedCollectionView.delegate = self

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let songList = MediaModelController.shared.recentSongs(for: 10) else { return }
		self.recentTracks = songList
		self.recentlyPlayedCollectionView.reloadData()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.recentlyPlayedCollectionView.frame = CGRect(origin: self.recentlyPlayedCollectionView.frame.origin, size: CGSize(width: self.recentlyPlayedCollectionView.frame.width, height: self.recentlyPlayedCollectionView.contentSize.height))
		self.tableView.contentSize.height = self.recentlyPlayedCollectionView.contentSize.height + self.tableView.estimatedRowHeight * 5 + (self.tabBarController?.tabBar.frame.height ?? 0)
	}
}
