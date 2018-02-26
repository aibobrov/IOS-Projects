//
//  NSAttribitedStringExtension.swift
//  Notes
//
//  Created by Artem Bobrov on 28.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension NSMutableAttributedString {
	func add(image: UIImage) {
		let textAttachment = NSTextAttachment()
		textAttachment.image = image

		self.append(NSAttributedString(string: "\n"))
		self.append(NSAttributedString(attachment: textAttachment))
		self.append(NSAttributedString(string: "\n"))
	}

	var images: [UIImage] {
		var imagesArray = [UIImage]()
		self.enumerateAttribute(NSAttributedStringKey.attachment, in: NSMakeRange(0, self.string.count), options: NSAttributedString.EnumerationOptions.reverse) {
			(value, range, stop) in
			guard let textAttachment = value as? NSTextAttachment, let image = textAttachment.image else { return }
				imagesArray.append(image)
		}
		return imagesArray
	}

	static func noteStyledAttributedString(from attributedString: NSAttributedString) -> NSMutableAttributedString {
		let text = NSMutableAttributedString(attributedString: attributedString)
		text.addAttributes(AppStyle.noteTextAttributes, range: NSMakeRange(0, text.string.count))
		return text
	}

	static var emptyNoteAttributedString: NSMutableAttributedString {
		let attributedString = NSMutableAttributedString(string: "")
		attributedString.addAttributes(AppStyle.noteTextAttributes, range: NSMakeRange(0, attributedString.string.count))
		return attributedString
	}
}
