//
//  SectionLabelCollectionReusableView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class SectionLabelCollectionReusableView: UICollectionReusableView {
	@IBOutlet weak var titleLabel: UILabel!


	var title: String? {
		didSet {
			guard let title = title else { return }
			titleLabel.text = title
		}
	}
}
