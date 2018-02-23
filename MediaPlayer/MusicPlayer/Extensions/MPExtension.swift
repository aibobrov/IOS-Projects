//
//  MPExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 07.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer
import AVFoundation

extension MPMediaItem {
	var isPlayable: Bool {
		return !self.isCloudItem && self.assetURL != nil
	}

	var artistAlbumFormatted: String? {
		guard let artistName = self.artist,
			let albumName = self.albumArtist else { return nil }
		return "\(artistName) • \(albumName)"
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
