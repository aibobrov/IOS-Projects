//
//  TabBarController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 18.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		self.popupBar.barStyle = .prominent
		self.popupBar.barTintColor = .white
		self.popupBar.tintColor = .white
		self.popupBar.progressViewStyle = .bottom
		self.popupContentView.popupCloseButtonStyle = .chevron
		self.popupBar.inheritsVisualStyleFromDockingView = false
		self.popupInteractionStyle = .drag
		self.popupBar.backgroundStyle = .dark
		self.popupBar.backgroundColor = .clear
	}
}
