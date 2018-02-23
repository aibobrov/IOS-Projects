//
//  MainMenuCollectionViewDelegates+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 21.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension MainMenuTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
		case UICollectionElementKindSectionHeader:
			return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MainMenuTableViewController.RecentMusicHeaderIdentifier, for: indexPath)
		default:
			fatalError("Unexpected element kind")
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return recentTracksData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMenuTableViewController.MediaItemCollectionViewCellIdentifier, for: indexPath) as! MediaItemCollectionViewCell
		cell.item = recentTracksData[indexPath.row]
		return cell
	}

	// MARK: Recently played collectionView cell is clicked
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! MediaItemCollectionViewCell
		guard let item = cell.item else { return }
		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			cell.onClickAnimation()
		}
		
		self.playerViewController.currentPlaylist = self.recentTracksData
		self.playerViewController.player.nowPlayingItem = item
		self.playerViewController.play()
	}
}
