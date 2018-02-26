//
//  RootTableViewController.swift
//  Notes
//
//  Created by Artem Bobrov on 26.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit
import CoreData

class RootTableViewController: UITableViewController {
	// MARK: - Identifiers
	static let NoteCellIdentifier = "NoteCellIdentifier"
	static let NoteSequeIdentifier = "NoteSequeIdentifier"

	// MARK: - Variables
	lazy var managedContext: NSManagedObjectContext = {
		let delegate = UIApplication.shared.delegate as! AppDelegate
		return delegate.persistentContainer.viewContext
	}()

	lazy var searchController: UISearchController = {
		let controller = UISearchController(searchResultsController: nil)
		controller.hidesNavigationBarDuringPresentation = false
		controller.searchBar.placeholder = "Search"
		controller.obscuresBackgroundDuringPresentation = false
		controller.searchResultsUpdater = self
		return controller
	}()

	var notes = [Note]()
	lazy var filteredNotes = [Note]()

	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
		navigationItem.searchController = searchController
		DispatchQueue.main.async {
			let request = Note.notesFetchRequest()
			do {
				let result = try self.managedContext.fetch(request)
				self.notes = result
			} catch {}
		}

    }
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		DispatchQueue.main.async {
			self.notes.forEach { [unowned self] (note) in
				if note.isEmpty || note.toDelete {
					self.managedContext.delete(note)
				}
			}
			self.notes = self.notes.filter({ !$0.isEmpty && !$0.toDelete })
			self.tableView.reloadData()
		}
	}
	
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return searchController.isFiltering ? filteredNotes.count : notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: RootTableViewController.NoteCellIdentifier, for: indexPath) as! NoteTableViewCell
		
		let note = searchController.isFiltering ? filteredNotes[indexPath.row] : notes[indexPath.row]
		cell.note = note
        return cell
    }
	
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
			managedContext.delete(notes[indexPath.row])
			notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } else if editingStyle == .insert {
			tableView.insertRows(at: [indexPath], with: .automatic)
		}
    }

	// MARK: - Navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let noteViewController = segue.destination as? NoteViewController {
			if let cell = sender as? UITableViewCell,
				let indexPath = self.tableView.indexPath(for: cell) {
				noteViewController.note = notes[indexPath.row]
			} else if let note = notes.last {
				noteViewController.note = note
			}
		}
	}
}
