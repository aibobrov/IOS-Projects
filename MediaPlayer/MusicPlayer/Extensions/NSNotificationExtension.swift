//
//  NSNotificationExtension.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 15.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation


extension NSNotification.Name {
	static let AudioPlayerPlay = NSNotification.Name("AudioPlayerPlay")
	static let AudioPlayerPause = NSNotification.Name("AudioPlayerPause")
	static let AudioPlayerStop = NSNotification.Name("AudioPlayerStop")
	static let AudioPlayerForward = NSNotification.Name("AudioPlayerForward")
	static let AudioPlayerRewind = NSNotification.Name("AudioPlayerRewind")
	static let AudioPlayerTrackDidChange = NSNotification.Name("AudioPlayerChangeTrack")
//////	static let AudioPlayerAppendQueue = NSNotification.Name("AudioPlayerAppendQueue")
}
