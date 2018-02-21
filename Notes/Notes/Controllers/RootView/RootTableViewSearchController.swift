//
//  RootTableViewSearchController.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension RootTableViewController: UISearchResultsUpdating {
	// MARK: - Search controller results update
	func updateSearchResults(for searchController: UISearchController) {
		guard let text = searchController.searchBar.text else { return }
		filteredNotes = notes.filter({($0.attributedText?.string.lowercased().hasPrefix(text.lowercased()))!})
		tableView.reloadData()
	}
}
