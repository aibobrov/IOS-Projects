//
//  NoteTableViewControllerActions.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

extension NotesTableViewController {
	@IBAction func composeNoteButtonClicked(_ sender: UIBarButtonItem) {
		performSegue(withIdentifier: self.noteFromCellIdentifier, sender: self)
	}
}
