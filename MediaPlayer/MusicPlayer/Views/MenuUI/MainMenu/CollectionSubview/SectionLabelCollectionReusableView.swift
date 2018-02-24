//
//  SectionLabelCollectionReusableView.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class SectionLabelCollectionReusableView: UICollectionReusableView {
	lazy var titleLabel: UILabel = {
		let label = UILabel(frame: self.frame)
		label.textColor = .white
		label.font = UIFont.boldSystemFont(ofSize: 17)
		label.frame.size.width -= 16
		label.frame.origin.x = 16
		return label
	}()

	var title: String? {
		didSet {
			guard let title = title else { return }
			titleLabel.text = title
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		self.addSubview(titleLabel)
		self.backgroundColor = UIColor.darkGray.withAlphaComponent(0.05)
	}
}
