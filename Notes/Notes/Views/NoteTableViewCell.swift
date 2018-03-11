//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Artem Bobrov on 30.01.2018.
//  Copyright © 2018 Artem Bobrov. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
	@IBOutlet weak var noteTitleLabel: UILabel!
	@IBOutlet weak var dateNoteLabel: UILabel!
	@IBOutlet weak var noteImageView: UIImageView!


	func setInfo(with note: Note?) {
		guard let note = note else { return }
		dateNoteLabel.text = note.createdDate?.shortString

		noteTitleLabel.text = note.attributedText?.string
		if let textImage = note.images.first {
			noteImageView.isHidden = false
			noteImageView.layer.cornerRadius = 4
			noteImageView.image = textImage
		} else { noteImageView.isHidden = true }
	}

	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
