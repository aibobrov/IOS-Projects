//
//  TabBarController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 18.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
//	override func viewDidLoad() {
//		NotificationCenter.default.addObserver(forName: NSNotification.Name.AudioPlayerForward, object: nil, queue: OperationQueue.main) { (notification) in
//			if AudioPlayer.shared.followingTrack == nil {
//				self.dismissPopupBar(animated: true, completion: nil)
//			}
//		}
//	}

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
