//
//  StyleExtensions.swift
//  Notes
//
//  Created by Artem Bobrov on 30.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
	static let schoolBusYellow = UIColor(red:1.00, green:0.85, blue:0.00, alpha:1.00)
}

extension UIFont {
	static let noteFont = UIFont.systemFont(ofSize: 20)
}

extension NSMutableParagraphStyle {
	static var noteParagraphStyle: NSMutableParagraphStyle {
		let style = NSMutableParagraphStyle()
		style.lineSpacing = 10
		return style
	}
}


struct AppStyle {
	static let noteTextAttributes: [NSAttributedStringKey: Any] =
		[NSAttributedStringKey.font : UIFont.noteFont,
		 NSAttributedStringKey.paragraphStyle : NSMutableParagraphStyle.noteParagraphStyle]

}

