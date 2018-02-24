//
//  SectionLabelCollectionReusableView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class SectionLabelCollectionReusableView: UICollectionReusableView {
	var titleLabel: UILabel

	var title: String? {
		didSet {
			guard let title = title else { return }
			titleLabel.text = title
		}
	}


	override init(frame: CGRect) {
		titleLabel = UILabel(frame: frame)
		super.init(frame: frame)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		titleLabel = UILabel(coder: aDecoder)!
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		titleLabel.textColor = .white
		titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
		titleLabel.frame.size.width -= 16
		titleLabel.frame.origin.x = 16

		self.addSubview(titleLabel)
		self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.05)
	}
}
