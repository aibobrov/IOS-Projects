//
//  MainMenuTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 21.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class MainMenuTableViewController: TableViewWithMusicPlayerBarTableViewController {
	static let RecentMusicHeaderIdentifier = "RecentMusicHeaderIdentifier"
	static let MediaItemCollectionViewCellIdentifier = "MediaItemCollectionViewCellIdentifier"

	@IBOutlet weak var recentlyPlayedCollectionView: UICollectionView!

	var recentTracksData = [MPMediaItem]()

	// MARK: Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
		recentlyPlayedCollectionView.register(UINib(nibName: "MediaItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MainMenuTableViewController.MediaItemCollectionViewCellIdentifier)

		self.notificationCenterObserversSetup()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard AppleMusicPermissionChecker.hasPermission,
			let tracks = MediaModelController.shared.recentSongs(for: 20) else { return }
		self.recentTracksData = tracks
		self.recentlyPlayedCollectionView.reloadData()
		self.updateViewContentSize()
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		self.playerViewController.player.prepareToPlay()
	}
	
	// MARK: NotificationCenter observers setup
	private func notificationCenterObserversSetup() {
		NotificationCenter.default.addObserver(forName: NSNotification.Name.MPMediaLibraryDidChange, object: nil, queue: nil) { [unowned self] (_) in
			guard AppleMusicPermissionChecker.hasPermission,
				let tracks = MediaModelController.shared.recentSongs(for: 20) else { return }
			self.recentTracksData = tracks
			self.recentlyPlayedCollectionView.reloadData()
			self.updateViewContentSize()
		}

		NotificationCenter.default.addObserver(forName: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: nil) { [unowned self] (notification) in
			guard let player = notification.object as? MPMusicPlayerApplicationController,
				let track = player.nowPlayingItem else { return }
			self.tabBarController?.popupBar.layer.backgroundColor = track.artwork?.image(at: self.tabBarController?.popupBar.frame.size ?? CGSize.zero)?.averageColor?.bgColor.cgColor ?? UIColor.clear.cgColor
		}
	}


	private func updateViewContentSize() {
		self.recentlyPlayedCollectionView.layoutIfNeeded()
		self.recentlyPlayedCollectionView.frame = CGRect(origin: self.recentlyPlayedCollectionView.frame.origin, size: CGSize(width: self.recentlyPlayedCollectionView.frame.width, height: self.recentlyPlayedCollectionView.contentSize.height))
		self.tableView.contentSize.height = self.recentlyPlayedCollectionView.contentSize.height + self.tableView.estimatedRowHeight * 5 + (self.tabBarController?.tabBar.frame.height ?? 0)
	}
}
