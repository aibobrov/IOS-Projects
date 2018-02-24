//
//  AlbumDetailTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumDetailTableViewController: TableViewWithMusicPlayerBarTableViewController {
	static let AlbumDetailTableViewControllerCellIdentifier = "AlbumDetailTableViewControllerCellIdentifier"
	weak var album: MPMediaItemCollection?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
	// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		print("count \(album?.count ?? 0)")
        return album?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumDetailTableViewController.AlbumDetailTableViewControllerCellIdentifier, for: indexPath) as! AlbumTableViewCell
//		print("item \(album?.items[indexPath.row].title ?? "")")
		cell.item = album?.items[indexPath.row]
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! AlbumTableViewCell

		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			tableView.deselectRow(at: indexPath, animated: false)
		}
		playerViewController.currentPlaylist = album?.items ?? []
		playerViewController.player.nowPlayingItem = cell.item
		playerViewController.play()
	}

}
