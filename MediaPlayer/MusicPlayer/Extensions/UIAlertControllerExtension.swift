//
//  UIAlertControllerExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 12.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//


import UIKit

extension UIAlertController {
	static func crashAlert(with text: String, with message: String) -> UIAlertController {
		let alert = UIAlertController(title: text, message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Exit", style: .destructive, handler: { (_) in
			exit(0)
		}))
		return alert
	}
}

