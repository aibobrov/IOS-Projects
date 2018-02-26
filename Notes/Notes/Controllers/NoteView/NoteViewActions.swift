//
//  NoteViewActions.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension NoteViewController {
	// MARK: - Button actions
	@IBAction func createNoteBarButtonClicked(_ sender: UIBarButtonItem) {
		guard let rootController = navigationController?.getSubController(RootTableViewController.self) else {
			return
		}
		let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: rootController.managedContext) as! Note
		newNote.loadInitData()
		rootController.notes.append(newNote)

		self.note = newNote
		updateView()
	}
	
	@IBAction func addBarButtonClicked(_ sender: UIBarButtonItem) {
		let imagePickerController = UIImagePickerController()
		imagePickerController.delegate = self
		let alert = UIAlertController()
		alert.addAction(UIAlertAction(title: "Take phote or video", style: .default, handler: { [unowned self] (action) in
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

	@IBAction func dateBarButtonItemClicked(_ sender: NoteDateBarButton) {
		noteTextView.resignFirstResponder()
		guard let note = note else { return }
		sender.currentStateIndex += 1
		sender.setTitle(with: note.dates[sender.currentStateIndex])
	}

	@IBAction func throwOutNoteBarButtonClicked(_ sender: UIBarButtonItem) {
		note?.toDelete = true

		self.navigationController?.popToRootViewController(animated: true)
	}
}
