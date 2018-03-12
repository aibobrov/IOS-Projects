//
//  CoreDataStack.swift
//  Notes
//
//  Created by Artem Bobrov on 12.03.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import CoreData

class CoreDataStack {
	lazy var container: NSPersistentContainer = {
		let container = NSPersistentContainer(name: "Notes")
		container.loadPersistentStores(completionHandler: { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		})
		return container
	}()

	var managedContext: NSManagedObjectContext {
		return container.viewContext
	}
}

