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

	@IBOutlet weak var rewindButton: PlayerActionButton!
	@IBOutlet weak var fastForwardButton: PlayerActionButton!
	@IBOutlet weak var playPauseButton: PlayerActionButton!
	@IBOutlet weak var playlistCollectionView: UICollectionView!
	@IBOutlet weak var sliderView: PlayerSliderView!

	internal var playlist = [MPMediaItem]()

	var currentPlaylist: [MPMediaItem] {
		set {
			player.setQueue(with: newValue)
			playlist = newValue
		}
		get {
			return self.playlist
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
		button.addTarget(self, action: #selector(playPauseButtonClicked(_:)), for: .touchUpInside)
		button.setImage(#imageLiteral(resourceName: "small-play"), for: .normal)
		button.alternativeImage = #imageLiteral(resourceName: "small-pause")
		let buttonItem = UIBarButtonItem(customView: button)

		return buttonItem
	}()

	lazy var forwardBarButtonItem: UIBarButtonItem = {
		let button = PlayerActionButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
		button.addTarget(self, action: #selector(fastForwardButtonClicked(_:)), for: .touchUpInside)
		button.setImage(#imageLiteral(resourceName: "fast-forward"), for: .normal)
		let buttonItem = UIBarButtonItem(customView: button)
		return buttonItem
	}()

	lazy var timer = ProgressTimer(with: 0.001) { (timer) in
		let playbackTime = self.player.currentPlaybackTime
		if !playbackTime.isNaN {
			self.sliderView.playbackSlider.isEnabled = true
			self.sliderView.currentTime = playbackTime
		} else {
			self.sliderView.currentTime = nil
			self.sliderView.playbackSlider.value = 0
			self.sliderView.playbackSlider.isEnabled = false
		}
		self.popupItem.progress = self.sliderView.playbackSlider.value
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
		timer.stop()
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

	// MARK: NotifactionCenter observers setup
	private func notificationCenterObserversSetup() {
		NotificationCenter.default.addObserver(forName: NSNotification.Name.MPMusicPlayerControllerPlaybackStateDidChange, object: nil, queue: nil) { (notification) in
			guard let player = notification.object as? MPMusicPlayerApplicationController else { return }
			switch player.playbackState {
			case .stopped, .paused, .interrupted, .seekingForward, .seekingBackward:
				self.timer.stop()
				self.playPauseButton.switchImages()
				(self.playPauseBarButtonItem.customView as? PlayerActionButton)?.switchImages()
			case .playing:
				self.timer.start()
				self.playPauseButton.switchImages()
				(self.playPauseBarButtonItem.customView as? PlayerActionButton)?.switchImages()
			}
		}

		NotificationCenter.default.addObserver(forName: NSNotification.Name.MPMusicPlayerControllerNowPlayingItemDidChange, object: nil, queue: nil) { (notification) in
			guard let player = notification.object as? MPMusicPlayerApplicationController else { return }
			self.updatePopupBarData(with: player.nowPlayingItem)
			self.sliderView.durationTime = player.nowPlayingItem?.playbackDuration
			let indexPath = IndexPath(row: player.indexOfNowPlayingItem, section: 0)
			self.playlistCollectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: true)
		}
	}

	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		guard let cell = playlistCollectionView.centerCell as? MediaItemCollectionViewCell else { return }
		self.player.nowPlayingItem = cell.item
		self.play()
	}
}

// MARK: - Player view controller actions
extension PlayerViewController {
	@IBAction func playPauseButtonClicked(_ sender: PlayerActionButton) {
		sender.onClickAnimation()
		if player.isPlaying {
			self.pause()
		} else {
			self.play()
		}
	}

	@IBAction func rewindButtonClicked(_ sender: PlayerActionButton) {
		sender.onClickAnimation()
		self.rewind()
	}

	@IBAction func fastForwardButtonClicked(_ sender: PlayerActionButton) {
		sender.onClickAnimation()
		self.forward()
	}

	@IBAction func playerSliderTouchDown(_ sender: SeekPlayerSlider) {
		timer.stop()
	}
	@IBAction func playerSliderTouchUpInside(_ sender: SeekPlayerSlider) {
		self.player.currentPlaybackTime = TimeInterval(sender.value) * (sliderView.durationTime ?? 0)
		timer.start()
	}
	@IBAction func playerSliderValueChanged(_ sender: SeekPlayerSlider) {
		sliderView.currentTime = TimeInterval(sender.value) * (sliderView.durationTime ?? 0)
	}
}
