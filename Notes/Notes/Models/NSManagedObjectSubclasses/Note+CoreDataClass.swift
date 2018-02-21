//
//  Note+CoreDataClass.swift
//  Notes
//
//  Created by Artem Bobrov on 03.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//
//

import Foundation
import CoreData
import UIKit

@objc(Note)
public class Note: NSManagedObject {
	func loadInitData() {
		self.attributedText = NSMutableAttributedString.emptyNoteAttributedString
		self.createdDate = NSDate()
		self.changedDate = NSDate()
	}

	func add(image: UIImage) {
		attributedText?.add(image: image)
	}

	var toDelete: Bool = false

	var isEmpty: Bool {
		set {
			if newValue {
				attributedText = NSMutableAttributedString()
			}
		}
		get {
			return attributedText.string.isEmpty
		}
	}

	var dates : [NSDate] {
		return [createdDate!, createdDate!, changedDate!]
	}

	var images : [UIImage] {
		return attributedText!.images
	}
}
