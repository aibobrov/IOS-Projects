//
//  SearchSongsTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 27.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class SearchSongsTableViewController: SongsTableViewController, UISearchBarDelegate {
	override func viewDidLoad() {
        super.viewDidLoad()
		data = nil
    }
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		guard searchText.count > 0 else {
			data = nil
			tableView.reloadData()
			return
		}
		let query = MediaModelController.shared.songsQuery(containing: searchText)
		let items = query.items ?? []
		data = DataCollectionModel(sections: nil, collections: [MPMediaItemCollection(items: items)])
		tableView.reloadData()
	}

	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		searchBar.endEditing(true)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data?.collections?.first?.items.count ?? 0
	}

	override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 0
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		return nil
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: tableViewReusableIdentidier, for: indexPath) as! MediaTableViewCell
		cell.item = data?.collections?.first?.items[indexPath.row]
		return cell
	}
	
}
