//
//  PlayerViewControllerDelegates+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 22.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension PlayerViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return currentPlaylist.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainMenuTableViewController.MediaItemCollectionViewCellIdentifier, for: indexPath) as! MediaItemCollectionViewCell
		cell.item = currentPlaylist[indexPath.row]
		return cell
	}
}
