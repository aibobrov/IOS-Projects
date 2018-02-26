//
//  BaseExtensions.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 25.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension Array {
	public mutating func resize(_ size: Int, fillWith value: Iterator.Element) {
		let c = count
		if c < size {
			append(contentsOf: repeatElement(value, count: c.distance(to: size)))
		} else if c > size {
			let newEnd = index(startIndex, offsetBy: size)
			removeSubrange(newEnd ..< endIndex)
		}
	}

	public func resized(_ size: Int, fillWith value: Iterator.Element) -> Array {
		var collection = Array(self)
		collection.resize(Int(size), fillWith: value)
		return collection
	}
}

extension Sequence {
	var shuffled: [Element] {
		var result = Array(self)
		result.shuffle()
		return result
	}
}

extension MutableCollection {
	mutating func shuffle() {
		let c = count
		guard c > 1 else { return }

		for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
			let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
			let i = index(firstUnshuffled, offsetBy: d)
			swapAt(firstUnshuffled, i)
		}
	}
}
extension Collection {
	var squared: [[Self.Element]]? {
		let sqrtCount = Int(sqrt(Double(Int(count))))
		guard Int(sqrtCount) * Int(sqrtCount) == self.count else { return nil }
		var values = [[Self.Element]](repeating: [Self.Element](), count: sqrtCount)
		for (index, element) in self.enumerated() {
			let i = index / sqrtCount
			values[i].append(element)
		}
		return values
	}
}
