//
//  CGExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 06.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension CGSize {
	static func *=(value: inout CGSize, mult: Double) {
		value.width *= CGFloat(mult)
		value.height *= CGFloat(mult)
	}
}

extension CGFloat {
	var normalized: CGFloat {
		return self / 255.0
	}
}
