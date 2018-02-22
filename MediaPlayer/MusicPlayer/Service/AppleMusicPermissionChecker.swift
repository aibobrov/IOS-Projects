//
//  AppleMusicPermissionChecker.swift
//  MusicPlayer
//
//  Created by Artem Bobrov on 12.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import MediaPlayer


class AppleMusicPermissionChecker  {
	private init() {}

	static var hasPermission: Bool {
		return MPMediaLibrary.authorizationStatus() == .authorized
	}

	static var isPermissionRequestAvailable: Bool {
		return MPMediaLibrary.authorizationStatus() == .notDetermined
	}

	static func request(completion: @escaping (Bool) -> Void) {
		guard self.isPermissionRequestAvailable else { return }
		MPMediaLibrary.requestAuthorization { (status) in
			DispatchQueue.main.async {
				completion(status == .authorized)
			}
		}
	}
}
