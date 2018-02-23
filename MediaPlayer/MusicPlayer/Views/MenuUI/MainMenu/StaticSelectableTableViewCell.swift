//
//  StaticSelectableTableViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 05.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		let bgView = UIView(frame: self.frame)
		bgView.backgroundColor = UIColor.black

		self.selectedBackgroundView = bgView
	}
}
