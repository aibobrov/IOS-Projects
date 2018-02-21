//
//  SearchExtension.swift
//  Notes
//
//  Created by Artem Bobrov on 28.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit


extension UISearchBar {
	var isEmpty: Bool {
		return self.text?.isEmpty ?? true
	}
}

extension UISearchController {
	var isFiltering: Bool {
		return !searchBar.isEmpty && isActive
	}
}
