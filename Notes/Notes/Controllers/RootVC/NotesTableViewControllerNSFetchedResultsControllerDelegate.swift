//
//  NotesTableViewControllerNSFetchedResultsControllerDelegate.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import CoreData
import UIKit

extension NotesTableViewController: NSFetchedResultsControllerDelegate {

	func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.beginUpdates()
	}

	func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
		tableView.endUpdates()
	}

	func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
		switch type {
		case .insert:
			if let indexPath = newIndexPath {
				tableView.insertRows(at: [indexPath], with: .automatic)
			}
		case .delete:
			if let indexPath = indexPath {
				tableView.deleteRows(at: [indexPath], with: .automatic)
			}
		case .update:
			if let indexPath = indexPath,
				let cell = tableView.cellForRow(at: indexPath) as? NoteTableViewCell {
				let note = resultsController.object(at: indexPath)
				cell.setInfo(with: note)
			}
		default:
			break
		}
	}
}
