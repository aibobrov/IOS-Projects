//
//  PlaylistTableViewControllerTableViewDelegate+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 26.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
extension PlaylistTableViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.collections?.count ?? 0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistTableViewController.PlaylistTableViewCellIdentifier, for: indexPath) as! PlaylistTableViewCell

		if let collection = data.collections?[indexPath.row] {
			let imageSize = cell.artworksImageView.frame.size
			var playlist = PlaylistModel(title: collection.playlistTitle, collection: collection)

			if let collage = collection.playlistCollage(for: 4, with: imageSize) {
				playlist.image = collage
			} else if collection.count > 0,
				let artwork = collection.representativeItem?.artwork?.image(at: imageSize) {
				playlist.image = artwork
			} else {
				playlist.image = UIImage(color: .clear, size: imageSize)
			}

			cell.item = playlist
		}
		return cell
	}
}
