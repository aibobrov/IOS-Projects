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
			return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reusableHeaderIdentifier, for: indexPath)
		default:
			fatalError("Unexpected element kind")
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return recentTracksData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewReusableIdentifier, for: indexPath) as! MediaItemCollectionViewCell
		cell.setInfo(with: recentTracksData.items[indexPath.row])
		return cell
	}

	// MARK: Recently played collectionView cell is clicked
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! MediaItemCollectionViewCell
		let item = recentTracksData.items[indexPath.row]
		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			cell.onClickAnimation()
		}
		DispatchQueue.main.async {
			self.playerViewController.currentPlaylist = self.recentTracksData.items
		}
		DispatchQueue.main.async {
			self.playerViewController.player.nowPlayingItem = item
			self.playerViewController.play()
		}


	}
}
