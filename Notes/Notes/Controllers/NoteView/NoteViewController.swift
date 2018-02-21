//
//  NoteViewController.swift
//  Notes
//
//  Created by Artem Bobrov on 26.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
	// MARK: - Variables
	@IBOutlet weak var noteTextView: NoteTextView!
	@IBOutlet weak var dateBarButton: NoteDateBarButton!
	@IBOutlet weak var createNoteBarButtonItem: UIBarButtonItem!

	weak var note: Note? = nil
	
	lazy var tapGestureRecognizer: UITapGestureRecognizer = {
		let gesture  = UITapGestureRecognizer(target: self, action: #selector(editTextRecognizerTabbed))
		gesture.numberOfTapsRequired = 1
		return gesture
	}()

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()

		noteTextView.attributedText = NSMutableAttributedString.noteStyledAttributedString(from: noteTextView.attributedText)
		noteTextView.delegate = self
		noteTextView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: noteTextView.frame.height * 0.9, right: 10)

		noteTextView.addGestureRecognizer(tapGestureRecognizer)

		dateBarButton.titleLabel?.adjustsFontSizeToFitWidth = true
    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateView()
		createNoteBarButtonItem.isEnabled = !noteTextView.attributedText.string.isEmpty
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		note?.attributedText = noteTextView.textStorage
	}

	// MARK: - Support functions
	@objc func editTextRecognizerTabbed(sender: UITapGestureRecognizer) {
		noteTextView.isEditable = true
		noteTextView.becomeFirstResponder()
	}

	func updateView() {
		if let note = note {
			noteTextView.attributedText = note.attributedText
			dateBarButton.setTitle(with: note.dates[dateBarButton.currentStateIndex])
		}
	}
}
