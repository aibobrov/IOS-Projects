//
//  TableViewWithSmallMusicBarTableViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 06.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class TableViewWithMusicPlayerBarTableViewController: UITableViewController {
	lazy var playerViewController: PlayerViewController = {
		let appDelegate = UIApplication.shared.delegate as! AppDelegate
		let vc = appDelegate.playerViewController
		return vc
	}()
}
