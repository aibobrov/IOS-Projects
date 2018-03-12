//
//  UIImage+CGSizeExtensions.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension UIImage {
	func scaleToFit(width: CGFloat) -> UIImage? {

		guard let cgImageObject = self.cgImage else {
			return nil
		}
		guard width < self.size.width else {
			return self
		}
		let aspectRatio = width / size.width
		return UIImage(cgImage: cgImageObject, scale: 1 / aspectRatio, orientation: self.imageOrientation)
	}
}

extension Date {

	var shortString: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "d.MM.YYYY"
		formatter.locale = Locale(identifier: "en_EN")

		return formatter.string(from: self)
	}

	var string: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "dd MMMM YYYY г., HH:mm"
		formatter.locale = Locale(identifier: "en_EN")

		return formatter.string(from: self)
	}
}


