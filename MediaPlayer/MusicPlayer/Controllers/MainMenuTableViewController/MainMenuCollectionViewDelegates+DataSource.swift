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
		return recentTracks.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMenuTableViewController.RecentMusicCellIdentifier, for: indexPath) as! MediaItemCollectionViewCell
		cell.item = recentTracks[indexPath.row]
		return cell
	}

	// collectionview cell clicked
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = recentlyPlayedCollectionView.cellForItem(at: indexPath) as! MediaItemCollectionViewCell
//		guard let item = cell.item else { return }
		cell.onClickAnimation()
		print("clicked")
	}
}
