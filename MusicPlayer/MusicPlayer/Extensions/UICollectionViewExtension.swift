//
//  UICollectionViewExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 23.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension UICollectionView {
	var centerPoint : CGPoint {
		return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y);
	}

	var centerCellIndexPath: IndexPath? {
		return self.indexPathForItem(at: self.centerPoint)
	}

	var centerCell: UICollectionViewCell? {
		guard let indexPath = self.centerCellIndexPath else { return nil }
		return self.cellForItem(at: indexPath)
	}
}
