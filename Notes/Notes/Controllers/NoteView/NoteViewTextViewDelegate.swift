//
//  NoteViewTextViewDelegate.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit

extension NoteViewController: UITextViewDelegate {
	// MARK: - text view delegate
	func textViewDidChange(_ textView: UITextView) {
		createNoteBarButtonItem.isEnabled = !noteTextView.attributedText.string.isEmpty
		note?.changedDate = NSDate()
		
		if let note = note { dateBarButton.setTitle(with: note.dates[dateBarButton.currentStateIndex]) }
	}

	func textViewDidEndEditing(_ textView: UITextView) {
		noteTextView.isEditable = false
	}
	func textView(_ textView: UITextView, shouldInteractWith textAttachment: NSTextAttachment, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
		return false
	}
}
