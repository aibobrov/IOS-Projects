//
//  UIImage+CGSizeExtensions.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	func scaleToFit(newWidth: CGFloat) -> UIImage? {

		guard let cgImageObject = self.cgImage else {
			return nil
		}
		guard newWidth < self.size.width else {
			return self
		}
		let aspectRatio = newWidth / size.width
		return UIImage(cgImage: cgImageObject, scale: 1 / aspectRatio, orientation: self.imageOrientation)
	}
}
enum NoteDateState: String {
	case normal = ""
	case created = "Создано: "
	case changed = "Изменено: "
}
extension NSDate {

	var shortString: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "d.MM.YYYY"
		formatter.locale = Locale(identifier: "ru_RU")

		return formatter.string(from: self as Date)
	}

	func string(with state: NoteDateState) -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd MMMM YYYY г., HH:mm"
		formatter.locale = Locale(identifier: "ru_RU")

		return "\(state.rawValue)\(formatter.string(from: self as Date))"
	}
}

