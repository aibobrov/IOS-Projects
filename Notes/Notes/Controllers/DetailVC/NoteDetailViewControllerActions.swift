//
//  NoteDetailViewControllerActions.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension NoteDetailViewController {
	@objc func editTextRecognizerTabbed(_ sender: UITapGestureRecognizer) {
		noteTextView.isEditable = true
		noteTextView.becomeFirstResponder()
	}
	@objc func keyboardWillShow(_ notification: NSNotification) {
		let key = "UIKeyboardFrameEndUserInfoKey"
		guard let keyboardFrame = notification.userInfo?[key] as? NSValue else { return }

		let keyboardHeight = keyboardFrame.cgRectValue.height

		noteTextView.textContainerInset.bottom = keyboardHeight
		bottomViewLayoutConstraint.constant = -keyboardHeight

		UIView.animate(withDuration: 0.3) {
			self.view.layoutIfNeeded()
		}
	}

	@objc func keyboardWillHide(_ notification: NSNotification) {
		bottomViewLayoutConstraint.constant = 0
		noteTextView.textContainerInset.bottom = 0
		UIView.animate(withDuration: 0.3) {
			self.view.layoutIfNeeded()
		}
	}

	@IBAction func trashButtonClicked(_ sender: Any) {
		noteTextView.attributedText = NSAttributedString()
		self.dismissAndResign()
	}
	@IBAction func addButtonClicked(_ sender: Any) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		let alert = UIAlertController()
		alert.addAction(UIAlertAction(title: "Take photo or video", style: .default, handler: { [unowned self] (action) in
			imagePickerController.sourceType = .camera
			imagePickerController.showsCameraControls = true
			self.present(imagePickerController, animated: true, completion: nil)
		}))
		alert.addAction(UIAlertAction(title: "Library", style: .default, handler: { [unowned self] (action) in
			imagePickerController.sourceType = .photoLibrary
			self.present(imagePickerController, animated: true, completion: nil)
		}))
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	@IBAction func newNoteButtonClicked(_ sender: Any) {
		DispatchQueue.main.async {
			self.saveNoteIfNeeded()
			self.noteTextView.attributedText = NSAttributedString()

			self.note = Note(context: self.managedContext)
			self.note?.creationDate = Date()
		}
	}
}
