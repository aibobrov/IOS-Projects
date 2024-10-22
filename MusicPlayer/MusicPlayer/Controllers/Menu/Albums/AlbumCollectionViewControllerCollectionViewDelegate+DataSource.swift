//
//  AlbumCollectionViewControllerCollectionViewDelegate+DataSource.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 24.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension AlbumCollectionViewController {
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return data.sections?.count ?? 0
	}

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.sections?[section].range.length ?? 0
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewReusabeIdentifier, for: indexPath) as! MediaAlbumCollectionViewCell

		cell.setInfo(with: data.collection(for: indexPath)?.representativeItem)

		return cell
	}

	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		switch kind {
		case UICollectionElementKindSectionHeader:
			let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: albumCollectionViewReusableViewIdentifier, for: indexPath) as! SectionLabelCollectionReusableView
			view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.05)
			view.setInfo(with: data.sections?[indexPath.section].title)
			return view
		default:
			fatalError("Unexpected element kind")
		}
	}


	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell = collectionView.cellForItem(at: indexPath) as! MediaAlbumCollectionViewCell
		cell.onClickAnimation()
	}

}
