//
//  AlbumCollectionViewController.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import MediaPlayer

class AlbumCollectionViewController: UICollectionViewController {
	static let AlbumCollectionViewCellIdentifier = "AlbumCollectionViewCellIdentifier"
	static let AlbumCollectionViewReusableViewIdentifier = "AlbumCollectionViewReusableViewIdentifier"
	
	var query = MediaModelController.shared.albumsQuery

    override func viewDidLoad() {
        super.viewDidLoad()
    }

	/*
	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using [segue destinationViewController].
	// Pass the selected object to the new view controller.
	}
	*/
}
