//
//  AppDelegate.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 21.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	lazy var playerViewController: PlayerViewController = {
		let vc = PlayerViewController(nibName: String(describing: PlayerViewController.self), bundle: nil)
		return vc
	}()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		MPMediaLibrary.default().beginGeneratingLibraryChangeNotifications()
		AppleMusicPermissionChecker.request()
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
	}

	func applicationWillTerminate(_ application: UIApplication) {
		playerViewController.player.stop()
		playerViewController.player.endGeneratingPlaybackNotifications()
	}
}

