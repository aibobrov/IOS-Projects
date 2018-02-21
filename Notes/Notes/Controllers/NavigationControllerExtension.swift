//
//  NavigationControllerExtension.swift
//  Notes
//
//  Created by Artem Bobrov on 03.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit


extension UINavigationController {

	func getSubController<T>(_: T.Type) -> T? {
		return self.viewControllers.filter({$0 is T}).first as? T
	}
}
