//
//  NotesTableViewController.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController {
	// MARK: - Identifiers
	var noteTableViewIdentifier: String { return "NoteTableViewIdentifier" }
	var noteFromCellIdentifier: String { return "NoteDetailSegueIdentifier" }

	// MARK: - Properties
	var resultsController: NSFetchedResultsController<Note>!
	let coreDataStack = CoreDataStack()
	var isFiltering = false

    override func viewDidLoad() {
        super.viewDidLoad()
		let request: NSFetchRequest<Note> = Note.fetchRequest()
		let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: true)

		request.sortDescriptors = [sortDescriptor]

		resultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: coreDataStack.managedContext, sectionNameKeyPath: nil, cacheName: nil)
		resultsController.delegate = self
		fetchData()
    }

	func fetchData() {
		do {
			try resultsController.performFetch()
		} catch {
			print("Perform fetch error: \(error)")
		}
	}

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.sections?[section].numberOfObjects ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: noteTableViewIdentifier, for: indexPath) as! NoteTableViewCell
		let note = resultsController.object(at: indexPath)
		cell.setInfo(with: note)
        return cell
    }

	override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
			let note = self.resultsController.object(at: indexPath)
			self.resultsController.managedObjectContext.delete(note)
			do {
				try self.resultsController.managedObjectContext.save()
				completion(true)
			} catch {
				print("delete failed: \(error)")
				completion(false)
			}
		}
		action.image = #imageLiteral(resourceName: "trash")

		return UISwipeActionsConfiguration(actions: [action])
	}

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let destinationVC = segue.destination as? NoteDetailViewController else { return }

		destinationVC.managedContext = coreDataStack.managedContext
		if let cell = sender as? NoteTableViewCell,
			let indexPath = tableView.indexPath(for: cell) {
			destinationVC.note = resultsController.object(at: indexPath)
		} else {
			destinationVC.note = nil
		}
    }
}
