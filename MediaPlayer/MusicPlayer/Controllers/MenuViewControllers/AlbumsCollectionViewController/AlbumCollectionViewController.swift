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

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return query.collectionSections?.count ?? 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return query.collectionSections?[section].range.length ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewController.AlbumCollectionViewCellIdentifier, for: indexPath) as! MediaAlbumCollectionViewCell

		if let range = query.collectionSections?[indexPath.section].range {
			cell.item = query.collections?[range.location + indexPath.row].items.first
			cell.album = query.collections?[range.location]
		}
    
        return cell
    }

	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
		case UICollectionElementKindSectionHeader:
			let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AlbumCollectionViewController.AlbumCollectionViewReusableViewIdentifier, for: indexPath) as! SectionLabelCollectionReusableView
			view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.05)
			view.title = query.collectionSections?[indexPath.section].title
			return view
		default:
			fatalError("Unexpected element kind")
		}
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
