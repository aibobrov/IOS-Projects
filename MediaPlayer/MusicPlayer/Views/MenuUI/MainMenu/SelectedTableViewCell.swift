//
//  StaticSelectableTableViewCell.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 05.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class SelectedTableViewCell: UITableViewCell {
	private lazy var blackView:  UIView = {
		let bgView = UIView(frame: self.frame)
		bgView.backgroundColor = UIColor.black
		return bgView
	}()

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}


	private func setup() {
		self.selectedBackgroundView = blackView
	}
}
