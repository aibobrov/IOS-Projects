//
//  MPExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 07.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer

extension MPMediaItem {
	var hasLastPlayedDate: Bool {
		return self.lastPlayedDate != nil
	}

	var artistAlbumFormatted: String? {
		guard let artistName = self.artist,
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
