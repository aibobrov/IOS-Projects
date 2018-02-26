//
//  SongsTableViewControllerTableViewDelegate+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension SongsTableViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return query.itemSections?.count ?? 0
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return query.itemSections?[section].range.length ?? 0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: SongsTableViewController.SongTableViewCellIdentidier, for: indexPath) as! MediaTableViewCell
		if let range = query.itemSections?[indexPath.section].range {
			let index = range.location + indexPath.row
			cell.item = query.items?[index]
		}
		return cell
	}

	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 20
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let height = self.tableView(tableView, heightForHeaderInSection: section)
		let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: height)
		let view = SectionLabelCollectionReusableView(frame: rect)
		view.title = query.itemSections?[section].title
		return view
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell

		guard let playlist = query.items else { return }

		DispatchQueue.main.async {
			self.playerViewController.currentPlaylist = playlist
		}
		DispatchQueue.main.async {
			self.playerViewController.player.nowPlayingItem = cell.item
			self.playerViewController.play()
		}

		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			tableView.deselectRow(at: indexPath, animated: false)
		}
	}
}
