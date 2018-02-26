//
//  MPExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 07.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer
import UIKit

extension MPMediaItemCollection {
	var playlistTitle: String? {
		return self.value(forProperty: MPMediaPlaylistPropertyName) as! String?
	}

	func playlistCollage(for amount: Int, with size: CGSize) -> UIImage? {
		let imageSize = CGSize(width: size.width / CGFloat(sqrt(Double(amount))),
							   height: size.height / CGFloat(sqrt(Double(amount))))
		guard let images = self
			.albumArtworks(for: amount)
			.map({ $0.image(at: imageSize) ?? UIImage(color: .clear, size: imageSize) })
			.squared else { return nil }
		return  UIImage.collage(from: images, with: size)
	}

	func albumArtworks(for amount: Int) -> [MPMediaItemArtwork] {
		var albumPersistentIDSet = Set<MPMediaEntityPersistentID>()
		var artworks = [MPMediaItemArtwork]()
		for item in self.items {
			guard  let artwork = item.artwork else { continue }
			let albumPersistentID = item.albumPersistentID
			if !albumPersistentIDSet.contains(albumPersistentID) {
				artworks.append(artwork)
				albumPersistentIDSet.insert(albumPersistentID)
			}

			if artworks.count == amount {
				break
			}
		}
		return artworks
	}

}

extension MPMediaItem {
	var hasLastPlayedDate: Bool {
		return self.lastPlayedDate != nil
	}

	var artistAlbumFormatted: String? {
		guard let artistName = self.albumArtist,
			let albumName = self.albumTitle else { return nil }
		return "\(artistName) • \(albumName)"
	}

	var genreYearFormatted: String? {
		guard let genre = self.genre, let year = self.releaseDate?.year else { return nil}
		return "\(genre) • \(year)"
	}
}

extension MPMusicPlayerController {
	func setQueue(with items: [MPMediaItem]) {
		self.setQueue(with: MPMediaItemCollection(items: items))
	}
}

extension MPMusicPlayerApplicationController {
	var isPlaying: Bool {
		return self.playbackState == .playing
	}
}


extension MPVolumeView {
	var slider: UISlider {
		return self.subviews.first(where: {$0 is UISlider})! as! UISlider
	}

	var routeButton: UIButton {
		return self.subviews.filter({$0 is UIButton}).last! as! UIButton
	}
}
