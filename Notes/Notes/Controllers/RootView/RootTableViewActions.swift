//
//  RootTableViewActions.swift
//  Notes
//
//  Created by Artem Bobrov on 29.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension RootTableViewController {
	// MARK: - New note action
	@IBAction func createNoteBarButtonClicked(_ sender: UIBarButtonItem) {
		let newNote = NSEntityDescription.insertNewObject(forEntityName: "Note", into: managedContext) as! Note
		newNote.loadInitData()
		notes.append(newNote)

		performSegue(withIdentifier: RootTableViewController.NoteSequeIdentifier, sender: self)
	}
}
