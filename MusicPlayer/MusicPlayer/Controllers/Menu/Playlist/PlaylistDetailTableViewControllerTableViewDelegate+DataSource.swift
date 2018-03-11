//
//  PlaylistDetailTableViewControllerTableViewDelegate+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension PlaylistDetailTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playlist.collection.items.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: tableViewReusableIdentidier, for: indexPath) as! MediaTableViewCell

		cell.setInfo(with: playlist.collection.items[indexPath.row])

		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			tableView.deselectRow(at: indexPath, animated: false)
		}
		DispatchQueue.main.async {
			self.playerViewController.currentPlaylist = self.playlist.collection.items
		}
		DispatchQueue.main.async {
			self.playerViewController.player.nowPlayingItem = self.playlist.collection.items[indexPath.row]
			self.playerViewController.play()
		}
	}
}
