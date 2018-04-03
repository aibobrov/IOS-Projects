//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController {
	// MARK: - Properties
	var managedContext: NSManagedObjectContext!
	var note: Note?

	@IBOutlet weak var noteTextView: UITextView!
	@IBOutlet weak var bottomViewLayoutConstraint: NSLayoutConstraint!

	lazy var tapGestureRecognizer: UITapGestureRecognizer = {
		let gesture  = UITapGestureRecognizer(target: self, action: #selector(editTextRecognizerTabbed(_:)))
		gesture.numberOfTapsRequired = 1
		return gesture
	}()

	// MARK: - Lifecycle
	override func viewDidLoad() {
        super.viewDidLoad()
		
		NotificationCenter.default.addObserver( self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)

		noteTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
		noteTextView.addGestureRecognizer(tapGestureRecognizer)
		noteTextView.delegate = self

		noteTextView.selectAll(self)
		noteTextView.becomeFirstResponder()
		self.updateView()
    }

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.saveNoteIfNeeded()
	}

	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
	}

	@objc func saveNoteIfNeeded() {
		guard let attributedString = self.noteTextView.attributedText else { return }
		if attributedString.string.isEmpty {
			if let note = self.note {
				self.managedContext.delete(note)
			}
		} else {
			if self.note == nil {
				self.note = Note(context: self.managedContext)
				self.note!.creationDate = Date()
			}
			self.note!.attributedData = attributedString
		}

		do {
			try self.managedContext.save()
		} catch {
			print("Failed to change managedContext: \(error) ")
		}
	}

	func updateView() {
		guard let note = note else { return }
		if let attributedText = note.attributedText {
			noteTextView.attributedText = attributedText
		}
	}

	func dismissAndResign() {
		self.navigationController?.popToRootViewController(animated: true)
		noteTextView.resignFirstResponder()
	}
}
