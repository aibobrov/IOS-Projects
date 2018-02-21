//
//  Note+CoreDataProperties.swift
//  Notes
//
//  Created by Artem Bobrov on 03.02.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public static func notesFetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var attributedText: NSMutableAttributedString!
    @NSManaged public var createdDate: NSDate!
    @NSManaged public var changedDate: NSDate!

}
