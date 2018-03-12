//
//  NoteExtension.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension Note {
	func add(image: UIImage) {
		guard let attributedText = self.attributedText else { return }
		let mutableString = NSMutableAttributedString(attributedString: attributedText)
		mutableString.add(image: image)
		self.attributedData = mutableString as NSAttributedString
	}

	var attributedText: NSAttributedString? {
		return self.attributedData as? NSAttributedString
	}

	var images : [UIImage] {
		return self.attributedText?.images ?? [UIImage]()
	}

	var isEmpty: Bool {
		return self.attributedText?.string.isEmpty ?? true
	}
}
