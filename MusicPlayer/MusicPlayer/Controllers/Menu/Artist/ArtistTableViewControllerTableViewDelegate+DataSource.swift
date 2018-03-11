//
//  ArtistTableViewControllerTableViewDelegate+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension ArtistTableViewController {
	override func numberOfSections(in tableView: UITableView) -> Int {
		return data.sections?.count ?? 0
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.sections?[section].range.length ?? 0
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ArtistTableViewController.ArtistTableViewCellIdentifier, for: indexPath) as! ArtistTableViewCell
		
		cell.setInfo(with: data.collection(for: indexPath)?.representativeItem)

		return cell
	}

	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 20
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let height = self.tableView(tableView, heightForHeaderInSection: section)
		let rect = CGRect(x: 0, y: 0, width: self.view.frame.width, height: height)
		let view = SectionLabelCollectionReusableView(frame: rect)
		view.setInfo(with: data.sections?[section].title)
		return view
	}
}
