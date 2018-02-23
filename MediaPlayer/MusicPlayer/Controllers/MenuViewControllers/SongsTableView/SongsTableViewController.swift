//
//  SongsTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class SongsTableViewController: TableViewWithMusicPlayerBarTableViewController {

	static let SongTableViewCellIdentidier = "SongTableViewCellIdentidier"

	lazy var query = MediaModelController.shared.songsQuery


	override func viewDidLoad() {
		super.viewDidLoad()
		let insets = navigationController?.popupBar.frame.size.height ?? 0
		self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: insets, right: 0)
	}
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		playerViewController.player.prepareToPlay()
	}

    // MARK: - Table view data source

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
		let view = UIView(frame: rect)
		view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.2)
		let label = UILabel(frame: rect)
		label.text = query.itemSections?[section].title
		label.textColor = .white
		label.baselineAdjustment = .alignCenters
		view.addSubview(label)
		label.frame.origin.x = 16
		return view
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.cellForRow(at: indexPath) as! MediaTableViewCell

		guard let playlist = query.items else { return }

		self.playerViewController.currentPlaylist = playlist
		self.playerViewController.player.nowPlayingItem = cell.item
		self.playerViewController.play()

		DispatchQueue.main.async {
			self.tabBarController?.presentPopupBar(withContentViewController: self.playerViewController, animated: true, completion: nil)
			tableView.deselectRow(at: indexPath, animated: false)
		}

	}
}
