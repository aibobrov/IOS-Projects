//
//  NoteDetailViewControllerTextViewDelegate.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension NoteDetailViewController: UITextViewDelegate {
	func textViewDidEndEditing(_ textView: UITextView) {
		noteTextView.isEditable = false
	}
}
