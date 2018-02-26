//
//  AlbumDetailTableViewControllerTableViewDelegate+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension AlbumDetailTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return album.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: AlbumDetailTableViewController.AlbumDetailTableViewControllerCellIdentifier, for: indexPath) as! AlbumTableViewCell
		cell.item = album.items[indexPath.row]
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! AlbumTableViewCell

		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			tableView.deselectRow(at: indexPath, animated: false)
		}
		DispatchQueue.main.async {
			self.playerViewController.currentPlaylist = self.album.items
		}
		DispatchQueue.main.async {
			self.playerViewController.player.nowPlayingItem = cell.item
			self.playerViewController.play()
		}
	}
}
