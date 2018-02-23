//
//  PlayerViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 22.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer
import UPCarouselFlowLayout

class PlayerViewController: UIViewController {
	static let PlaylistCollectionViewCellIdentifier = "MediaItemCollectionViewCellIdentifier"
	@IBOutlet weak var playlistCollectionView: UICollectionView!

	var currentPlaylist = [MPMediaItem]() {
		didSet {
			player.setQueue(with: currentPlaylist)
		}
	}

	lazy var player: MPMusicPlayerApplicationController = {
		let player = MPMusicPlayerController.applicationQueuePlayer
		player.beginGeneratingPlaybackNotifications()
		player.shuffleMode = .off
		return player
	}()

	lazy var carouselFlowLayout: UPCarouselFlowLayout = {
		let layout = UPCarouselFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 200, height: 238)
		layout.sideItemAlpha = 0.6
		layout.sideItemScale = 0.8
		return layout
	}()

	lazy var playPauseBarButtonItem: UIBarButtonItem = {
		let button = PlayerActionButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
		button.addTarget(self, action: #selector(playPausePopupItemClicked), for: .touchUpInside)
		button.setImage(#imageLiteral(resourceName: "small-play"), for: .normal)
		button.alternativeImage = #imageLiteral(resourceName: "small-pause")
		let buttonItem = UIBarButtonItem(customView: button)

		return buttonItem
	}()

	lazy var forwardBarButtonItem: UIBarButtonItem = {
		let button = PlayerActionButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
		button.addTarget(self, action: #selector(forwardPopupItemClicked), for: .touchUpInside)
		button.setImage(#imageLiteral(resourceName: "fast-forward"), for: .normal)
		let buttonItem = UIBarButtonItem(customView: button)
		return buttonItem
	}()

	lazy var timer = ProgressTimer(with: 0.002) { (timer) in
		let playbackTime = self.player.currentPlaybackTime
		if !playbackTime.isNaN {
			// switch on
		} else {
			// switch off
		}
	}

	// MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		self.popupItem.leftBarButtonItems = [playPauseBarButtonItem]
		self.popupItem.rightBarButtonItems = [forwardBarButtonItem]

		playlistCollectionView.register(UINib(nibName: "MediaItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: MainMenuTableViewController.MediaItemCollectionViewCellIdentifier)

		playlistCollectionView.collectionViewLayout = carouselFlowLayout

		notificationCenterObserversSetup()
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		player.prepareToPlay()
		let indexPath = IndexPath(row: player.indexOfNowPlayingItem, section: 0)
		playlistCollectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
	}

	deinit {
		player.stop()
		player.endGeneratingPlaybackNotifications()
	}

	// MARK: View updates
	func updatePopupBarData(with item: MPMediaItem?) {
		guard let item = item else {
			popupItem.setDefaults()
			return
		}
		if let artwork = item.artwork {
			self.popupItem.image = artwork.image(at: self.popupBar.imageView.frame.size)
		}

		self.popupItem.subtitle = item.artistAlbumFormatted ?? ""
		self.popupItem.title = item.title ?? ""
		self.popupItem.progress = 0
	}

	func updateViewData(with item: MPMediaItem?) {
//		guard let item = item else { return }
	}

	private func notificationCenterObserversSetup() {
		NotificationCenter.default.addObserver(forName: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange, object: nil, queue: OperationQueue.current) { (notification) in
			guard let player = notification.object as? MPMusicPlayerApplicationController else { return }
			switch player.playbackState {
			case .stopped, .paused, .playing, .interrupted:
				(self.playPauseBarButtonItem.customView as? PlayerActionButton)?.switchImages()
			default:
				break
			}
		}

		NotificationCenter.default.addObserver(forName: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: OperationQueue.current) { (notification) in
			guard let player = notification.object as? MPMusicPlayerApplicationController else { return }
			self.updatePopupBarData(with: player.nowPlayingItem)
			self.updateViewData(with: player.nowPlayingItem)
		}
	}
}
