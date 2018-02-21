//
//  NoteTextView.swift
//  Notes
//
//  Created by Artem Bobrov on 30.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class NoteTextView: UITextView {
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.isEditable = false
		self.tintColor = UIColor.schoolBusYellow

		self.allowsEditingTextAttributes = false
		self.textStorage.addAttributes(AppStyle.noteTextAttributes, range: NSMakeRange(0, self.textStorage.string.count))
    }
}
